; DESCRIPTION: Composite: Sets a single blue pixel at (510, 220) then Creates a orange circular shape at (223, 152) with radius 43.
; PLAN: r0=510(x), r1=220(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=152(y), r7=43(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 510
LDI r1, 220
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 152
LDI r7, 43
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
