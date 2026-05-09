; DESCRIPTION: Composite: Renders a orange disk with center (292, 93) and radius 60 then Sets a single magenta pixel at (83, 117).
; PLAN: r0=292(x), r1=93(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=83(x), r6=117(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 292
LDI r1, 93
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 83
LDI r6, 117
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
