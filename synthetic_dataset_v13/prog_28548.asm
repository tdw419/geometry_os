; DESCRIPTION: Draws a orange line from (510, 167) to (275, 81).
; PLAN: r0=510(x1), r1=167(y1), r2=275(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 167
LDI r2, 275
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
