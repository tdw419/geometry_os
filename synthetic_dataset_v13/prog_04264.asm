; DESCRIPTION: Composite: Creates a yellow circular shape at (389, 54) with radius 42 then Places a red dot at position (454, 119).
; PLAN: r0=389(x), r1=54(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=454(x), r6=119(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 389
LDI r1, 54
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 454
LDI r6, 119
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
