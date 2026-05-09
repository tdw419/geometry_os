; DESCRIPTION: Renders a orange line between points (127, 37) and (233, 112).
; PLAN: r0=127(x1), r1=37(y1), r2=233(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 37
LDI r2, 233
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
