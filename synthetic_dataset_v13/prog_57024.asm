; DESCRIPTION: Renders a blue line between points (156, 213) and (73, 78).
; PLAN: r0=156(x1), r1=213(y1), r2=73(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 213
LDI r2, 73
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
