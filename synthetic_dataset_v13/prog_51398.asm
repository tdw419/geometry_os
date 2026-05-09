; DESCRIPTION: Draws a blue line from (418, 236) to (466, 29).
; PLAN: r0=418(x1), r1=236(y1), r2=466(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 236
LDI r2, 466
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
