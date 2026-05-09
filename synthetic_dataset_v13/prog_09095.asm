; DESCRIPTION: Renders a orange line between points (453, 133) and (82, 86).
; PLAN: r0=453(x1), r1=133(y1), r2=82(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 133
LDI r2, 82
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
