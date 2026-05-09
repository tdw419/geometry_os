; DESCRIPTION: Composite: Sets a single magenta pixel at (445, 84) then Renders a yellow disk with center (414, 178) and radius 35.
; PLAN: r0=445(x), r1=84(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=414(x), r6=178(y), r7=35(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 445
LDI r1, 84
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 414
LDI r6, 178
LDI r7, 35
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
