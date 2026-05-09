; DESCRIPTION: Places a blue line segment connecting (66, 212) to (43, 243).
; PLAN: r0=66(x1), r1=212(y1), r2=43(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 212
LDI r2, 43
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
