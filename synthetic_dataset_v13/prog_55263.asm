; DESCRIPTION: Renders a orange line between points (19, 7) and (362, 148).
; PLAN: r0=19(x1), r1=7(y1), r2=362(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 7
LDI r2, 362
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
