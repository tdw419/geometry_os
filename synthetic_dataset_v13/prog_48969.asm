; DESCRIPTION: Composite: Places a magenta dot at position (418, 113) then Renders a black disk with center (211, 187) and radius 54.
; PLAN: r0=418(x), r1=113(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=211(x), r6=187(y), r7=54(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 418
LDI r1, 113
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 211
LDI r6, 187
LDI r7, 54
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
