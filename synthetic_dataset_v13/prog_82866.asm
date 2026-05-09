; DESCRIPTION: Renders a magenta line between points (15, 41) and (260, 114).
; PLAN: r0=15(x1), r1=41(y1), r2=260(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 41
LDI r2, 260
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
