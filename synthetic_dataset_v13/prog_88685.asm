; DESCRIPTION: Composite: Places a orange circle of radius 74 at center (318, 102) then Places a purple dot at position (271, 14).
; PLAN: r0=318(x), r1=102(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=271(x), r6=14(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 318
LDI r1, 102
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 271
LDI r6, 14
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
