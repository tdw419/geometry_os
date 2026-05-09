; DESCRIPTION: Renders a purple line between points (127, 0) and (41, 60).
; PLAN: r0=127(x1), r1=0(y1), r2=41(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 0
LDI r2, 41
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
