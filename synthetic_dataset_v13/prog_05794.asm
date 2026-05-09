; DESCRIPTION: Renders a magenta line between points (52, 106) and (115, 64).
; PLAN: r0=52(x1), r1=106(y1), r2=115(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 106
LDI r2, 115
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
