; DESCRIPTION: Composite: Places a magenta dot at position (331, 218) then Places a orange circle of radius 75 at center (332, 120).
; PLAN: r0=331(x), r1=218(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=332(x), r6=120(y), r7=75(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 331
LDI r1, 218
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 332
LDI r6, 120
LDI r7, 75
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
