; DESCRIPTION: Draws a orange line from (120, 31) to (142, 64).
; PLAN: r0=120(x1), r1=31(y1), r2=142(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 31
LDI r2, 142
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
