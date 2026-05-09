; DESCRIPTION: Composite: Places a blue dot at position (60, 135) then Creates a green circular shape at (463, 151) with radius 49.
; PLAN: r0=60(x), r1=135(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=463(x), r6=151(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 60
LDI r1, 135
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 463
LDI r6, 151
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
