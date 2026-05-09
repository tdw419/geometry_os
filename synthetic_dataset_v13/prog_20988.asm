; DESCRIPTION: Draws a black line from (159, 187) to (33, 30).
; PLAN: r0=159(x1), r1=187(y1), r2=33(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 187
LDI r2, 33
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
