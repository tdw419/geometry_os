; DESCRIPTION: Composite: Creates a green circular shape at (343, 83) with radius 36 then Renders a white line between points (26, 188) and (331, 18) then Sets a single blue pixel at (277, 25).
; PLAN: r0=343(x), r1=83(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x1), r6=188(y1), r7=331(x2), r8=18(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=277(x), r11=25(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 343
LDI r1, 83
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 188
LDI r7, 331
LDI r8, 18
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 277
LDI r11, 25
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
