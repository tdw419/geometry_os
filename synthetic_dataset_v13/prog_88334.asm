; DESCRIPTION: Draws a purple line from (443, 187) to (134, 30).
; PLAN: r0=443(x1), r1=187(y1), r2=134(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 187
LDI r2, 134
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
