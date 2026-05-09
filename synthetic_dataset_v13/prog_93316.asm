; DESCRIPTION: Composite: Places a green dot at position (216, 183) then Draws a yellow circle centered at (433, 100) with radius 77.
; PLAN: r0=216(x), r1=183(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=433(x), r6=100(y), r7=77(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 216
LDI r1, 183
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 433
LDI r6, 100
LDI r7, 77
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
