; DESCRIPTION: Composite: Sets a single magenta pixel at (1, 127) then Renders a black disk with center (84, 63) and radius 23.
; PLAN: r0=1(x), r1=127(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=84(x), r6=63(y), r7=23(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 1
LDI r1, 127
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 84
LDI r6, 63
LDI r7, 23
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
