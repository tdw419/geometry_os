; DESCRIPTION: Draws a purple line from (419, 221) to (321, 15).
; PLAN: r0=419(x1), r1=221(y1), r2=321(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 221
LDI r2, 321
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
