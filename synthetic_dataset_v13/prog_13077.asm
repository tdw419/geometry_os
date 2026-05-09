; DESCRIPTION: Composite: Sets a single blue pixel at (287, 97) then Places a cyan line segment connecting (345, 130) to (506, 182) then Creates a white circular shape at (293, 66) with radius 63.
; PLAN: r0=287(x), r1=97(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=345(x1), r6=130(y1), r7=506(x2), r8=182(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=293(x), r11=66(y), r12=63(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 287
LDI r1, 97
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 345
LDI r6, 130
LDI r7, 506
LDI r8, 182
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 66
LDI r12, 63
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
