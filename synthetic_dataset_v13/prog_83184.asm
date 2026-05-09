; DESCRIPTION: Composite: Places a white line segment connecting (147, 224) to (110, 159) then Places a yellow circle of radius 15 at center (441, 54).
; PLAN: r0=147(x1), r1=224(y1), r2=110(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=441(x), r6=54(y), r7=15(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 147
LDI r1, 224
LDI r2, 110
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 54
LDI r7, 15
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
