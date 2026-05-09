; DESCRIPTION: Draws a orange line from (490, 226) to (188, 16).
; PLAN: r0=490(x1), r1=226(y1), r2=188(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 226
LDI r2, 188
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
