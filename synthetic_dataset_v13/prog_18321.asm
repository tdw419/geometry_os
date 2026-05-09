; DESCRIPTION: Renders a magenta line between points (351, 193) and (260, 52).
; PLAN: r0=351(x1), r1=193(y1), r2=260(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 193
LDI r2, 260
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
