; DESCRIPTION: Places a orange line segment connecting (328, 140) to (27, 252).
; PLAN: r0=328(x1), r1=140(y1), r2=27(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 140
LDI r2, 27
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
