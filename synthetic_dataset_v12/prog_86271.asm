; DESCRIPTION: Composite: Places a white circle of radius 73 at center (135, 75) then Renders a white box of size 49x97 starting at (237, 34) then Renders a green line between points (113, 92) and (291, 150).
; PLAN: r0=135(x), r1=75(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x), r6=34(y), r7=49(width), r8=97(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=113(x1), r11=92(y1), r12=291(x2), r13=150(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 135
LDI r1, 75
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 34
LDI r7, 49
LDI r8, 97
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 113
LDI r11, 92
LDI r12, 291
LDI r13, 150
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
