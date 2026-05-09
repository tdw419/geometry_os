; DESCRIPTION: Composite: Draws a yellow line from (359, 51) to (236, 217) then Places a orange dot at position (148, 13).
; PLAN: r0=359(x1), r1=51(y1), r2=236(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=13(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 359
LDI r1, 51
LDI r2, 236
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 13
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
