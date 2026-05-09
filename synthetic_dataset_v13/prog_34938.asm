; DESCRIPTION: Draws a blue line from (338, 236) to (248, 31).
; PLAN: r0=338(x1), r1=236(y1), r2=248(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 236
LDI r2, 248
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
