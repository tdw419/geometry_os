; DESCRIPTION: Draws a magenta line from (321, 224) to (227, 113).
; PLAN: r0=321(x1), r1=224(y1), r2=227(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 224
LDI r2, 227
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
