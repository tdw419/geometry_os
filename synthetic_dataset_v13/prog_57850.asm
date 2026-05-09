; DESCRIPTION: Places a blue line segment connecting (317, 193) to (60, 243).
; PLAN: r0=317(x1), r1=193(y1), r2=60(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 193
LDI r2, 60
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
