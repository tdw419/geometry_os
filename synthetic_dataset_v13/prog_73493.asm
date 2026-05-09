; DESCRIPTION: Places a blue line segment connecting (419, 114) to (231, 242).
; PLAN: r0=419(x1), r1=114(y1), r2=231(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 114
LDI r2, 231
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
