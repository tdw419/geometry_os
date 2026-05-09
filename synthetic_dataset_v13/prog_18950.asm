; DESCRIPTION: Places a blue line segment connecting (221, 206) to (358, 31).
; PLAN: r0=221(x1), r1=206(y1), r2=358(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 206
LDI r2, 358
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
