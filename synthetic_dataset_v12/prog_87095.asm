; DESCRIPTION: Composite: Creates a purple circular shape at (58, 118) with radius 50 then Places a red dot at position (13, 134).
; PLAN: r0=58(x), r1=118(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=13(x), r6=134(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 58
LDI r1, 118
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 13
LDI r6, 134
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
