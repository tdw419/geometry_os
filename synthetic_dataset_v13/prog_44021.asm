; DESCRIPTION: Places a blue line segment connecting (475, 50) to (359, 231).
; PLAN: r0=475(x1), r1=50(y1), r2=359(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 50
LDI r2, 359
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
