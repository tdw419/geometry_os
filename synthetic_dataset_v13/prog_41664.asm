; DESCRIPTION: Renders a magenta line between points (87, 97) and (137, 137).
; PLAN: r0=87(x1), r1=97(y1), r2=137(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 97
LDI r2, 137
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
