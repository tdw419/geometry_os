; DESCRIPTION: Draws a blue line from (164, 35) to (335, 200).
; PLAN: r0=164(x1), r1=35(y1), r2=335(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 35
LDI r2, 335
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
