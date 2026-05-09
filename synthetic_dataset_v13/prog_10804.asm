; DESCRIPTION: Composite: Draws a red circle centered at (129, 176) with radius 45 then Sets a single magenta pixel at (487, 9).
; PLAN: r0=129(x), r1=176(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=487(x), r6=9(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 129
LDI r1, 176
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 487
LDI r6, 9
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
