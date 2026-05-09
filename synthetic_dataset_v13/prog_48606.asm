; DESCRIPTION: Places a purple line segment connecting (479, 4) to (254, 203).
; PLAN: r0=479(x1), r1=4(y1), r2=254(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 4
LDI r2, 254
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
