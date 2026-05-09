; DESCRIPTION: Draws a blue line from (488, 211) to (418, 89).
; PLAN: r0=488(x1), r1=211(y1), r2=418(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 211
LDI r2, 418
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
