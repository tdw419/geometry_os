; DESCRIPTION: Composite: Renders a white disk with center (150, 171) and radius 72 then Sets a single magenta pixel at (75, 83).
; PLAN: r0=150(x), r1=171(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x), r6=83(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 150
LDI r1, 171
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 83
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
