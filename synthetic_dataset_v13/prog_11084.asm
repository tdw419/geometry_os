; DESCRIPTION: Draws a orange line from (15, 187) to (308, 197).
; PLAN: r0=15(x1), r1=187(y1), r2=308(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 187
LDI r2, 308
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
