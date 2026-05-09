; DESCRIPTION: Composite: Sets a single magenta pixel at (330, 121) then Renders a white disk with center (111, 86) and radius 39.
; PLAN: r0=330(x), r1=121(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=111(x), r6=86(y), r7=39(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 330
LDI r1, 121
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 111
LDI r6, 86
LDI r7, 39
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
