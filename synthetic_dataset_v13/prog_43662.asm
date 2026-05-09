; DESCRIPTION: Places a orange line segment connecting (196, 120) to (472, 16).
; PLAN: r0=196(x1), r1=120(y1), r2=472(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 120
LDI r2, 472
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
