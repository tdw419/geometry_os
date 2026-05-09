; DESCRIPTION: Places a blue line segment connecting (396, 70) to (405, 252).
; PLAN: r0=396(x1), r1=70(y1), r2=405(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 70
LDI r2, 405
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
