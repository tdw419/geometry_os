; DESCRIPTION: Draws a blue line from (419, 100) to (292, 209).
; PLAN: r0=419(x1), r1=100(y1), r2=292(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 100
LDI r2, 292
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
