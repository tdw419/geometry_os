; DESCRIPTION: Composite: Places a magenta dot at position (417, 145) then Renders a white disk with center (255, 28) and radius 17.
; PLAN: r0=417(x), r1=145(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=255(x), r6=28(y), r7=17(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 417
LDI r1, 145
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 255
LDI r6, 28
LDI r7, 17
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
