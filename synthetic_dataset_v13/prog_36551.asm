; DESCRIPTION: Places a blue line segment connecting (470, 70) to (159, 231).
; PLAN: r0=470(x1), r1=70(y1), r2=159(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 70
LDI r2, 159
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
