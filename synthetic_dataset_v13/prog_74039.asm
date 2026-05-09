; DESCRIPTION: Composite: Places a green dot at position (125, 81) then Draws a purple circle centered at (162, 191) with radius 27.
; PLAN: r0=125(x), r1=81(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=162(x), r6=191(y), r7=27(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 125
LDI r1, 81
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 162
LDI r6, 191
LDI r7, 27
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
