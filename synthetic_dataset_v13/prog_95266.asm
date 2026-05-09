; DESCRIPTION: Composite: Places a black line segment connecting (341, 177) to (176, 175) then Places a orange circle of radius 27 at center (427, 85).
; PLAN: r0=341(x1), r1=177(y1), r2=176(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=427(x), r6=85(y), r7=27(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 177
LDI r2, 176
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 85
LDI r7, 27
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
