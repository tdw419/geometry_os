; DESCRIPTION: Draws a blue line from (45, 194) to (241, 233).
; PLAN: r0=45(x1), r1=194(y1), r2=241(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 194
LDI r2, 241
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
