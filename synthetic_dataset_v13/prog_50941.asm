; DESCRIPTION: Renders a orange line between points (127, 33) and (332, 74).
; PLAN: r0=127(x1), r1=33(y1), r2=332(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 33
LDI r2, 332
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
