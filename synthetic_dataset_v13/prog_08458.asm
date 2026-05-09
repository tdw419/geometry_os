; DESCRIPTION: Renders a magenta line between points (156, 120) and (363, 219).
; PLAN: r0=156(x1), r1=120(y1), r2=363(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 120
LDI r2, 363
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
