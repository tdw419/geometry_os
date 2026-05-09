; DESCRIPTION: Draws a orange line from (32, 30) to (283, 184).
; PLAN: r0=32(x1), r1=30(y1), r2=283(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 30
LDI r2, 283
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
