; DESCRIPTION: Places a blue line segment connecting (45, 186) to (300, 243).
; PLAN: r0=45(x1), r1=186(y1), r2=300(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 186
LDI r2, 300
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
