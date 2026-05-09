; DESCRIPTION: Draws a magenta line from (417, 66) to (199, 15).
; PLAN: r0=417(x1), r1=66(y1), r2=199(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 66
LDI r2, 199
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
