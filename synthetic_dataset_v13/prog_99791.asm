; DESCRIPTION: Draws a orange line from (252, 219) to (356, 251).
; PLAN: r0=252(x1), r1=219(y1), r2=356(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 219
LDI r2, 356
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
