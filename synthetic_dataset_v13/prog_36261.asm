; DESCRIPTION: Composite: Places a red circle of radius 35 at center (297, 142) then Places a black dot at position (409, 65).
; PLAN: r0=297(x), r1=142(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=65(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 297
LDI r1, 142
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 65
LDI r7, 0x000000
PSET r5, r6, r7
HALT
