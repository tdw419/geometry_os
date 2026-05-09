; DESCRIPTION: Draws a orange line from (183, 144) to (50, 88).
; PLAN: r0=183(x1), r1=144(y1), r2=50(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 144
LDI r2, 50
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
