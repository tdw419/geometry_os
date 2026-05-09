; DESCRIPTION: Renders a magenta line between points (30, 170) and (315, 41).
; PLAN: r0=30(x1), r1=170(y1), r2=315(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 170
LDI r2, 315
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
