; DESCRIPTION: Places a blue line segment connecting (14, 54) to (231, 125).
; PLAN: r0=14(x1), r1=54(y1), r2=231(x2), r3=125(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 54
LDI r2, 231
LDI r3, 125
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
