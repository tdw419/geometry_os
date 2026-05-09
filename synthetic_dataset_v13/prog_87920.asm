; DESCRIPTION: Draws a magenta line from (270, 181) to (283, 224).
; PLAN: r0=270(x1), r1=181(y1), r2=283(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 181
LDI r2, 283
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
