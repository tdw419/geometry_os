; DESCRIPTION: Composite: Sets a single green pixel at (43, 97) then Renders a magenta disk with center (125, 136) and radius 10.
; PLAN: r0=43(x), r1=97(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=125(x), r6=136(y), r7=10(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 43
LDI r1, 97
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 125
LDI r6, 136
LDI r7, 10
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
