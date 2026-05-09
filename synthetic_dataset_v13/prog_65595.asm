; DESCRIPTION: Renders a magenta line between points (377, 87) and (246, 37).
; PLAN: r0=377(x1), r1=87(y1), r2=246(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 87
LDI r2, 246
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
