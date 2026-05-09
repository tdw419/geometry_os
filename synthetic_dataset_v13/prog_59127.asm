; DESCRIPTION: Composite: Creates a yellow circular shape at (273, 194) with radius 35 then Places a orange dot at position (230, 54).
; PLAN: r0=273(x), r1=194(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=230(x), r6=54(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 273
LDI r1, 194
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 230
LDI r6, 54
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
