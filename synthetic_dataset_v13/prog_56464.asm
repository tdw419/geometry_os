; DESCRIPTION: Places a purple line segment connecting (108, 117) to (442, 180).
; PLAN: r0=108(x1), r1=117(y1), r2=442(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 117
LDI r2, 442
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
