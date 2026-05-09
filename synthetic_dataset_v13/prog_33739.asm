; DESCRIPTION: Composite: Creates a red circular shape at (335, 77) with radius 48 then Draws a black rectangle at (173, 16) with width 28 and height 83 then Places a white line segment connecting (59, 163) to (142, 186).
; PLAN: r0=335(x), r1=77(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x), r6=16(y), r7=28(width), r8=83(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=59(x1), r11=163(y1), r12=142(x2), r13=186(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 335
LDI r1, 77
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 16
LDI r7, 28
LDI r8, 83
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 163
LDI r12, 142
LDI r13, 186
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
