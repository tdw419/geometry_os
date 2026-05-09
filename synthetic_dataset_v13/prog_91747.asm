; DESCRIPTION: Renders a orange line between points (362, 75) and (4, 246).
; PLAN: r0=362(x1), r1=75(y1), r2=4(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 75
LDI r2, 4
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
