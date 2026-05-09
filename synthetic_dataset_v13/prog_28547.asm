; DESCRIPTION: Places a yellow line segment connecting (35, 252) to (249, 5).
; PLAN: r0=35(x1), r1=252(y1), r2=249(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 252
LDI r2, 249
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
