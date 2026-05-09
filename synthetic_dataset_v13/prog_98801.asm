; DESCRIPTION: Renders a orange line between points (362, 17) and (213, 123).
; PLAN: r0=362(x1), r1=17(y1), r2=213(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 17
LDI r2, 213
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
