; DESCRIPTION: Composite: Creates a white circular shape at (105, 123) with radius 33 then Places a blue line segment connecting (468, 231) to (88, 10) then Places a black dot at position (90, 232).
; PLAN: r0=105(x), r1=123(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=468(x1), r6=231(y1), r7=88(x2), r8=10(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=90(x), r11=232(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 105
LDI r1, 123
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 468
LDI r6, 231
LDI r7, 88
LDI r8, 10
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 232
LDI r12, 0x000000
PSET r10, r11, r12
HALT
