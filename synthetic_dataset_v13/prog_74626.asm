; DESCRIPTION: Draws a blue line from (163, 238) to (346, 35).
; PLAN: r0=163(x1), r1=238(y1), r2=346(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 238
LDI r2, 346
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
