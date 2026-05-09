; DESCRIPTION: Renders a magenta line between points (125, 139) and (358, 30).
; PLAN: r0=125(x1), r1=139(y1), r2=358(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 139
LDI r2, 358
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
