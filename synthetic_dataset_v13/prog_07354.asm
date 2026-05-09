; DESCRIPTION: Composite: Places a cyan dot at position (363, 185) then Draws a black circle centered at (270, 151) with radius 69.
; PLAN: r0=363(x), r1=185(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=270(x), r6=151(y), r7=69(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 363
LDI r1, 185
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 270
LDI r6, 151
LDI r7, 69
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
