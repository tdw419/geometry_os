; DESCRIPTION: Composite: Draws a orange line from (6, 198) to (187, 26) then Places a purple dot at position (478, 193).
; PLAN: r0=6(x1), r1=198(y1), r2=187(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=478(x), r6=193(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 6
LDI r1, 198
LDI r2, 187
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 193
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
