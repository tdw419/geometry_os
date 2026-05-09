; DESCRIPTION: Composite: Places a cyan circle of radius 37 at center (277, 205) then Sets a single purple pixel at (119, 83).
; PLAN: r0=277(x), r1=205(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=119(x), r6=83(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 277
LDI r1, 205
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 119
LDI r6, 83
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
