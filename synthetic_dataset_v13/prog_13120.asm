; DESCRIPTION: Composite: Places a green dot at position (431, 30) then Creates a blue circular shape at (132, 55) with radius 33.
; PLAN: r0=431(x), r1=30(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=132(x), r6=55(y), r7=33(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 431
LDI r1, 30
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 132
LDI r6, 55
LDI r7, 33
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
