; DESCRIPTION: Draws a magenta line from (427, 205) to (119, 192).
; PLAN: r0=427(x1), r1=205(y1), r2=119(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 205
LDI r2, 119
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
