; DESCRIPTION: Composite: Places a orange dot at position (345, 169) then Creates a magenta circular shape at (315, 180) with radius 52.
; PLAN: r0=345(x), r1=169(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=315(x), r6=180(y), r7=52(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 345
LDI r1, 169
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 315
LDI r6, 180
LDI r7, 52
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
