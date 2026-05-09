; DESCRIPTION: Composite: Creates a orange circular shape at (362, 52) with radius 23 then Places a red dot at position (435, 49).
; PLAN: r0=362(x), r1=52(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x), r6=49(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 362
LDI r1, 52
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 49
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
