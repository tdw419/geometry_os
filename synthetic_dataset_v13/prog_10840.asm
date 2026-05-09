; DESCRIPTION: Places a blue line segment connecting (94, 146) to (444, 238).
; PLAN: r0=94(x1), r1=146(y1), r2=444(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 146
LDI r2, 444
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
