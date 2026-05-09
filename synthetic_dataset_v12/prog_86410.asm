; DESCRIPTION: Draws a blue line from (477, 252) to (488, 159).
; PLAN: r0=477(x1), r1=252(y1), r2=488(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 252
LDI r2, 488
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
