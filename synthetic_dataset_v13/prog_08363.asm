; DESCRIPTION: Draws a blue line from (335, 146) to (299, 112).
; PLAN: r0=335(x1), r1=146(y1), r2=299(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 146
LDI r2, 299
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
