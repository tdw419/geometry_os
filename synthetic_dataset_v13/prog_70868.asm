; DESCRIPTION: Draws a blue line from (452, 117) to (230, 114).
; PLAN: r0=452(x1), r1=117(y1), r2=230(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 117
LDI r2, 230
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
