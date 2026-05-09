; DESCRIPTION: Draws a orange line from (366, 226) to (247, 6).
; PLAN: r0=366(x1), r1=226(y1), r2=247(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 226
LDI r2, 247
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
