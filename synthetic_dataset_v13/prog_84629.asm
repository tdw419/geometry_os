; DESCRIPTION: Renders a orange line between points (127, 183) and (455, 158).
; PLAN: r0=127(x1), r1=183(y1), r2=455(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 183
LDI r2, 455
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
