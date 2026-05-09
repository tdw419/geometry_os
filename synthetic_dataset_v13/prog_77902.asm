; DESCRIPTION: Composite: Places a black circle of radius 15 at center (181, 219) then Renders a white box of size 90x10 starting at (311, 59) then Renders a black line between points (426, 30) and (134, 144).
; PLAN: r0=181(x), r1=219(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x), r6=59(y), r7=90(width), r8=10(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=426(x1), r11=30(y1), r12=134(x2), r13=144(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 181
LDI r1, 219
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 59
LDI r7, 90
LDI r8, 10
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 30
LDI r12, 134
LDI r13, 144
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
