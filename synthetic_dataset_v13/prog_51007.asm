; DESCRIPTION: Renders a magenta line between points (501, 130) and (157, 106).
; PLAN: r0=501(x1), r1=130(y1), r2=157(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 130
LDI r2, 157
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
