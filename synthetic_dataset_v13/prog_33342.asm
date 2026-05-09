; DESCRIPTION: Composite: Places a red circle of radius 55 at center (229, 158) then Places a purple dot at position (227, 57).
; PLAN: r0=229(x), r1=158(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x), r6=57(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 229
LDI r1, 158
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 57
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
