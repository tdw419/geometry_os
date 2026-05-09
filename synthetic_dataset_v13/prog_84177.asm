; DESCRIPTION: Places a blue line segment connecting (143, 185) to (112, 231).
; PLAN: r0=143(x1), r1=185(y1), r2=112(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 185
LDI r2, 112
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
