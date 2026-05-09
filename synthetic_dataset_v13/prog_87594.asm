; DESCRIPTION: Composite: Sets a single magenta pixel at (382, 79) then Renders a purple disk with center (409, 213) and radius 37.
; PLAN: r0=382(x), r1=79(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=409(x), r6=213(y), r7=37(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 382
LDI r1, 79
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 409
LDI r6, 213
LDI r7, 37
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
