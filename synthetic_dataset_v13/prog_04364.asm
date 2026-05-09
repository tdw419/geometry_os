; DESCRIPTION: Renders a magenta line between points (63, 203) and (342, 31).
; PLAN: r0=63(x1), r1=203(y1), r2=342(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 203
LDI r2, 342
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
