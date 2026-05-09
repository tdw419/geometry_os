; DESCRIPTION: Composite: Places a orange dot at position (240, 225) then Creates a magenta circular shape at (107, 184) with radius 36.
; PLAN: r0=240(x), r1=225(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=107(x), r6=184(y), r7=36(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 240
LDI r1, 225
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 107
LDI r6, 184
LDI r7, 36
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
