; DESCRIPTION: Composite: Places a blue line segment connecting (393, 180) to (110, 46) then Places a white dot at position (233, 201) then Places a green circle of radius 78 at center (223, 154).
; PLAN: r0=393(x1), r1=180(y1), r2=110(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=201(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=223(x), r11=154(y), r12=78(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 393
LDI r1, 180
LDI r2, 110
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 201
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 223
LDI r11, 154
LDI r12, 78
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
