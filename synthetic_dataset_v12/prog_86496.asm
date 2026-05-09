; DESCRIPTION: Draws a magenta line from (381, 137) to (472, 124).
; PLAN: r0=381(x1), r1=137(y1), r2=472(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 137
LDI r2, 472
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
