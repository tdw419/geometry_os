; DESCRIPTION: Renders a magenta line between points (246, 11) and (180, 114).
; PLAN: r0=246(x1), r1=11(y1), r2=180(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 11
LDI r2, 180
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
