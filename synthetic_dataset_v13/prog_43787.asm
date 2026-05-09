; DESCRIPTION: Renders a magenta line between points (72, 203) and (84, 179).
; PLAN: r0=72(x1), r1=203(y1), r2=84(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 203
LDI r2, 84
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
