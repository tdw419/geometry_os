; DESCRIPTION: Places a blue line segment connecting (260, 72) to (16, 243).
; PLAN: r0=260(x1), r1=72(y1), r2=16(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 72
LDI r2, 16
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
