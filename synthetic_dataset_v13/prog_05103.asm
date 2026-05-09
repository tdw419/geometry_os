; DESCRIPTION: Places a purple line segment connecting (370, 229) to (92, 252).
; PLAN: r0=370(x1), r1=229(y1), r2=92(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 229
LDI r2, 92
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
