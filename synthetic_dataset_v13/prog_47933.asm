; DESCRIPTION: Draws a orange line from (240, 165) to (141, 205).
; PLAN: r0=240(x1), r1=165(y1), r2=141(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 165
LDI r2, 141
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
