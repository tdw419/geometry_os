; DESCRIPTION: Composite: Renders a yellow line between points (461, 105) and (329, 185) then Places a magenta dot at position (361, 201).
; PLAN: r0=461(x1), r1=105(y1), r2=329(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=361(x), r6=201(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 461
LDI r1, 105
LDI r2, 329
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 201
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
