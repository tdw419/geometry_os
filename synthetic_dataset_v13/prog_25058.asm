; DESCRIPTION: Composite: Sets a single magenta pixel at (282, 27) then Renders a black disk with center (392, 84) and radius 30.
; PLAN: r0=282(x), r1=27(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=392(x), r6=84(y), r7=30(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 282
LDI r1, 27
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 392
LDI r6, 84
LDI r7, 30
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
