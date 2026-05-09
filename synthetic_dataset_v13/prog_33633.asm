; DESCRIPTION: Renders a magenta line between points (246, 194) and (47, 30).
; PLAN: r0=246(x1), r1=194(y1), r2=47(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 194
LDI r2, 47
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
