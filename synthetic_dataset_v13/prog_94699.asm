; DESCRIPTION: Composite: Creates a blue circular shape at (323, 39) with radius 13 then Places a green dot at position (241, 205).
; PLAN: r0=323(x), r1=39(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=241(x), r6=205(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 323
LDI r1, 39
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 241
LDI r6, 205
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
