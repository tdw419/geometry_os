; DESCRIPTION: Draws a blue line from (356, 247) to (60, 183).
; PLAN: r0=356(x1), r1=247(y1), r2=60(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 247
LDI r2, 60
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
