; DESCRIPTION: Composite: Creates a yellow circular shape at (309, 177) with radius 20 then Places a green dot at position (222, 30).
; PLAN: r0=309(x), r1=177(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=222(x), r6=30(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 309
LDI r1, 177
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 222
LDI r6, 30
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
