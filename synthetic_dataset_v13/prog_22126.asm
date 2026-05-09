; DESCRIPTION: Composite: Places a white line segment connecting (125, 89) to (345, 99) then Renders a white box of size 35x18 starting at (259, 35) then Draws a green circle centered at (23, 45) with radius 18.
; PLAN: r0=125(x1), r1=89(y1), r2=345(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=259(x), r6=35(y), r7=35(width), r8=18(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=23(x), r11=45(y), r12=18(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 125
LDI r1, 89
LDI r2, 345
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 35
LDI r7, 35
LDI r8, 18
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 23
LDI r11, 45
LDI r12, 18
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
