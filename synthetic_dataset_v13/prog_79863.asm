; DESCRIPTION: Renders a magenta line between points (150, 211) and (8, 212).
; PLAN: r0=150(x1), r1=211(y1), r2=8(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 211
LDI r2, 8
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
