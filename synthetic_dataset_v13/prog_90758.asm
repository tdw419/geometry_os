; DESCRIPTION: Renders a magenta line between points (444, 97) and (8, 176).
; PLAN: r0=444(x1), r1=97(y1), r2=8(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 97
LDI r2, 8
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
