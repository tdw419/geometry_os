; DESCRIPTION: Composite: Creates a green circular shape at (177, 117) with radius 54 then Places a orange dot at position (133, 22).
; PLAN: r0=177(x), r1=117(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=133(x), r6=22(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 177
LDI r1, 117
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 133
LDI r6, 22
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
