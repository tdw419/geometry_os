; DESCRIPTION: Renders a magenta line between points (49, 203) and (51, 133).
; PLAN: r0=49(x1), r1=203(y1), r2=51(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 203
LDI r2, 51
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
