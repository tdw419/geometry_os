; DESCRIPTION: Renders a magenta line between points (203, 15) and (90, 75).
; PLAN: r0=203(x1), r1=15(y1), r2=90(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 15
LDI r2, 90
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
