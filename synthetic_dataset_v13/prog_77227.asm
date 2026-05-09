; DESCRIPTION: Draws a orange line from (156, 62) to (180, 115).
; PLAN: r0=156(x1), r1=62(y1), r2=180(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 62
LDI r2, 180
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
