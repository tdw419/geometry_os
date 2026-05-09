; DESCRIPTION: Draws a magenta line from (275, 179) to (192, 50).
; PLAN: r0=275(x1), r1=179(y1), r2=192(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 179
LDI r2, 192
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
