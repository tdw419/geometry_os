; DESCRIPTION: Draws a orange line from (263, 127) to (185, 205).
; PLAN: r0=263(x1), r1=127(y1), r2=185(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 127
LDI r2, 185
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
