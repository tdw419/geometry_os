; DESCRIPTION: Draws a black line from (139, 159) to (258, 107).
; PLAN: r0=139(x1), r1=159(y1), r2=258(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 159
LDI r2, 258
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
