; DESCRIPTION: Renders a orange line between points (187, 63) and (127, 105).
; PLAN: r0=187(x1), r1=63(y1), r2=127(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 63
LDI r2, 127
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
