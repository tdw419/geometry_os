; DESCRIPTION: Places a blue line segment connecting (143, 252) to (214, 30).
; PLAN: r0=143(x1), r1=252(y1), r2=214(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 252
LDI r2, 214
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
