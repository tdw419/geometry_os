; DESCRIPTION: Composite: Sets a single black pixel at (160, 224) then Places a orange line segment connecting (136, 237) to (112, 45).
; PLAN: r0=160(x), r1=224(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=136(x1), r6=237(y1), r7=112(x2), r8=45(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 224
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 136
LDI r6, 237
LDI r7, 112
LDI r8, 45
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
