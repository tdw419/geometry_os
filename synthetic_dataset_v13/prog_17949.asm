; DESCRIPTION: Renders a magenta line between points (167, 147) and (110, 30).
; PLAN: r0=167(x1), r1=147(y1), r2=110(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 147
LDI r2, 110
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
