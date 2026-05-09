; DESCRIPTION: Draws a blue line from (246, 83) to (102, 250).
; PLAN: r0=246(x1), r1=83(y1), r2=102(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 83
LDI r2, 102
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
