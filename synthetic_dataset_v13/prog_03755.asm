; DESCRIPTION: Composite: Places a purple circle of radius 26 at center (261, 104) then Places a yellow dot at position (204, 206).
; PLAN: r0=261(x), r1=104(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=204(x), r6=206(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 261
LDI r1, 104
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 204
LDI r6, 206
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
