; DESCRIPTION: Composite: Places a blue dot at position (78, 82) then Creates a green circular shape at (359, 34) with radius 24.
; PLAN: r0=78(x), r1=82(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=34(y), r7=24(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 78
LDI r1, 82
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 359
LDI r6, 34
LDI r7, 24
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
