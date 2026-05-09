; DESCRIPTION: Draws a blue line from (452, 160) to (415, 52).
; PLAN: r0=452(x1), r1=160(y1), r2=415(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 160
LDI r2, 415
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
