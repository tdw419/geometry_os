; DESCRIPTION: Renders a magenta line between points (185, 52) and (25, 126).
; PLAN: r0=185(x1), r1=52(y1), r2=25(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 52
LDI r2, 25
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
