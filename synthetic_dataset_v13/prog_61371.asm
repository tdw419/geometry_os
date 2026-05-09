; DESCRIPTION: Composite: Creates a yellow circular shape at (356, 141) with radius 71 then Renders a green line between points (134, 135) and (379, 133) then Places a white 44x67 rectangle at position (238, 92).
; PLAN: r0=356(x), r1=141(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x1), r6=135(y1), r7=379(x2), r8=133(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=238(x), r11=92(y), r12=44(width), r13=67(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 141
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 135
LDI r7, 379
LDI r8, 133
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 92
LDI r12, 44
LDI r13, 67
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
