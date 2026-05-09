; DESCRIPTION: Composite: Draws a orange line from (31, 133) to (390, 41) then Places a blue dot at position (354, 222).
; PLAN: r0=31(x1), r1=133(y1), r2=390(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=354(x), r6=222(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 31
LDI r1, 133
LDI r2, 390
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 222
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
