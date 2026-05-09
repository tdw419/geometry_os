; DESCRIPTION: Renders a magenta line between points (319, 137) and (128, 54).
; PLAN: r0=319(x1), r1=137(y1), r2=128(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 137
LDI r2, 128
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
