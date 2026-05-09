; DESCRIPTION: Draws a magenta line from (195, 219) to (325, 205).
; PLAN: r0=195(x1), r1=219(y1), r2=325(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 219
LDI r2, 325
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
