; DESCRIPTION: Draws a orange line from (180, 125) to (91, 158).
; PLAN: r0=180(x1), r1=125(y1), r2=91(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 125
LDI r2, 91
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
