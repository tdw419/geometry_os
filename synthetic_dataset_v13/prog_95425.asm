; DESCRIPTION: Composite: Sets a single green pixel at (231, 214) then Renders a red disk with center (126, 101) and radius 37.
; PLAN: r0=231(x), r1=214(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=126(x), r6=101(y), r7=37(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 231
LDI r1, 214
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 126
LDI r6, 101
LDI r7, 37
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
