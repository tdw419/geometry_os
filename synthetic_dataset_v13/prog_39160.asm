; DESCRIPTION: Composite: Places a purple dot at position (282, 234) then Places a green circle of radius 23 at center (117, 203).
; PLAN: r0=282(x), r1=234(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=117(x), r6=203(y), r7=23(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 282
LDI r1, 234
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 117
LDI r6, 203
LDI r7, 23
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
