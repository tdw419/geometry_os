; DESCRIPTION: Composite: Draws a yellow line from (249, 22) to (429, 204) then Places a orange dot at position (434, 201) then Creates a red circular shape at (234, 107) with radius 47.
; PLAN: r0=249(x1), r1=22(y1), r2=429(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=434(x), r6=201(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=234(x), r11=107(y), r12=47(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 249
LDI r1, 22
LDI r2, 429
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 201
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 234
LDI r11, 107
LDI r12, 47
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
