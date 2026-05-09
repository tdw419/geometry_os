; DESCRIPTION: Composite: Sets a single magenta pixel at (203, 209) then Renders a green disk with center (389, 113) and radius 41.
; PLAN: r0=203(x), r1=209(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=389(x), r6=113(y), r7=41(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 203
LDI r1, 209
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 389
LDI r6, 113
LDI r7, 41
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
