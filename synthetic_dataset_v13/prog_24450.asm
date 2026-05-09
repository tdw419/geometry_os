; DESCRIPTION: Composite: Draws a blue line from (495, 216) to (357, 54) then Creates a white circular shape at (355, 123) with radius 18 then Places a blue dot at position (439, 2).
; PLAN: r0=495(x1), r1=216(y1), r2=357(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=123(y), r7=18(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=439(x), r11=2(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 495
LDI r1, 216
LDI r2, 357
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 123
LDI r7, 18
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 439
LDI r11, 2
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
