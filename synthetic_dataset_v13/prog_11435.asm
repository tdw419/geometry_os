; DESCRIPTION: Draws a blue line from (494, 199) to (204, 233).
; PLAN: r0=494(x1), r1=199(y1), r2=204(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 199
LDI r2, 204
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
