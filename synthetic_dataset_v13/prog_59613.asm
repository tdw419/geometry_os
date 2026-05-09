; DESCRIPTION: Composite: Places a white circle of radius 14 at center (430, 240) then Renders a green box of size 31x13 starting at (30, 77) then Renders a magenta line between points (438, 138) and (457, 216).
; PLAN: r0=430(x), r1=240(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x), r6=77(y), r7=31(width), r8=13(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=438(x1), r11=138(y1), r12=457(x2), r13=216(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 430
LDI r1, 240
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 77
LDI r7, 31
LDI r8, 13
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 438
LDI r11, 138
LDI r12, 457
LDI r13, 216
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
