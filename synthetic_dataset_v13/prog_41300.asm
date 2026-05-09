; DESCRIPTION: Composite: Places a magenta dot at position (110, 119) then Creates a orange circular shape at (91, 113) with radius 66.
; PLAN: r0=110(x), r1=119(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=91(x), r6=113(y), r7=66(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 110
LDI r1, 119
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 91
LDI r6, 113
LDI r7, 66
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
