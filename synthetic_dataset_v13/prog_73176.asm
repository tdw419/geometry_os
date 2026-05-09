; DESCRIPTION: Composite: Sets a single magenta pixel at (180, 168) then Renders a purple disk with center (491, 108) and radius 18.
; PLAN: r0=180(x), r1=168(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=491(x), r6=108(y), r7=18(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 180
LDI r1, 168
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 491
LDI r6, 108
LDI r7, 18
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
