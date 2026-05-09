; DESCRIPTION: Composite: Places a black dot at position (403, 120) then Creates a blue circular shape at (309, 118) with radius 79.
; PLAN: r0=403(x), r1=120(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=309(x), r6=118(y), r7=79(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 403
LDI r1, 120
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 309
LDI r6, 118
LDI r7, 79
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
