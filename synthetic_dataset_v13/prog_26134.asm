; DESCRIPTION: Places a blue line segment connecting (90, 47) to (164, 74).
; PLAN: r0=90(x1), r1=47(y1), r2=164(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 47
LDI r2, 164
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
