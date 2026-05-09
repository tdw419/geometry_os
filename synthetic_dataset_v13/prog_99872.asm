; DESCRIPTION: Composite: Places a yellow line segment connecting (457, 211) to (69, 109) then Places a orange dot at position (361, 115).
; PLAN: r0=457(x1), r1=211(y1), r2=69(x2), r3=109(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=361(x), r6=115(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 457
LDI r1, 211
LDI r2, 69
LDI r3, 109
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 115
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
