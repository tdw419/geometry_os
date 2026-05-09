; DESCRIPTION: Composite: Creates a yellow circular shape at (220, 113) with radius 48 then Sets a single purple pixel at (432, 86).
; PLAN: r0=220(x), r1=113(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=432(x), r6=86(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 220
LDI r1, 113
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 432
LDI r6, 86
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
