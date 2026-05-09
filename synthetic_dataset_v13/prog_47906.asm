; DESCRIPTION: Draws a magenta line from (7, 224) to (359, 241).
; PLAN: r0=7(x1), r1=224(y1), r2=359(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 224
LDI r2, 359
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
