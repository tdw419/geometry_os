; DESCRIPTION: Renders a magenta line between points (363, 114) and (360, 101).
; PLAN: r0=363(x1), r1=114(y1), r2=360(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 114
LDI r2, 360
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
