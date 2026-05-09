; DESCRIPTION: Places a orange line segment connecting (196, 36) to (138, 173).
; PLAN: r0=196(x1), r1=36(y1), r2=138(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 36
LDI r2, 138
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
