; DESCRIPTION: Composite: Sets a single magenta pixel at (157, 241) then Renders a cyan disk with center (385, 55) and radius 20.
; PLAN: r0=157(x), r1=241(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=385(x), r6=55(y), r7=20(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 157
LDI r1, 241
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 385
LDI r6, 55
LDI r7, 20
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
