; DESCRIPTION: Renders a magenta line between points (406, 6) and (120, 158).
; PLAN: r0=406(x1), r1=6(y1), r2=120(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 6
LDI r2, 120
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
