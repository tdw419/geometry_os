; DESCRIPTION: Draws a green line from (508, 6) to (488, 155).
; PLAN: r0=508(x1), r1=6(y1), r2=488(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 6
LDI r2, 488
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
