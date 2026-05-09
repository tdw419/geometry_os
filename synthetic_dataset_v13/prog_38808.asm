; DESCRIPTION: Draws a magenta line from (444, 230) to (364, 56).
; PLAN: r0=444(x1), r1=230(y1), r2=364(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 230
LDI r2, 364
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
