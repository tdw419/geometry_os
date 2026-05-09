; DESCRIPTION: Places a blue line segment connecting (219, 71) to (231, 243).
; PLAN: r0=219(x1), r1=71(y1), r2=231(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 71
LDI r2, 231
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
