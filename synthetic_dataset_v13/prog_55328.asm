; DESCRIPTION: Draws a orange line from (283, 12) to (4, 146).
; PLAN: r0=283(x1), r1=12(y1), r2=4(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 12
LDI r2, 4
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
