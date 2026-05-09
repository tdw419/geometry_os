; DESCRIPTION: Composite: Creates a purple circular shape at (152, 186) with radius 63 then Places a red dot at position (426, 75).
; PLAN: r0=152(x), r1=186(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=426(x), r6=75(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 152
LDI r1, 186
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 426
LDI r6, 75
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
