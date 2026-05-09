; DESCRIPTION: Composite: Places a green dot at position (483, 93) then Places a blue circle of radius 52 at center (286, 170).
; PLAN: r0=483(x), r1=93(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=286(x), r6=170(y), r7=52(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 483
LDI r1, 93
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 286
LDI r6, 170
LDI r7, 52
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
