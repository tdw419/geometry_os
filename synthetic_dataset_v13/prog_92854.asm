; DESCRIPTION: Composite: Places a magenta dot at position (186, 65) then Creates a black circular shape at (431, 69) with radius 66.
; PLAN: r0=186(x), r1=65(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=431(x), r6=69(y), r7=66(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 186
LDI r1, 65
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 431
LDI r6, 69
LDI r7, 66
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
