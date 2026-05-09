; DESCRIPTION: Draws a magenta line from (77, 227) to (482, 101).
; PLAN: r0=77(x1), r1=227(y1), r2=482(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 227
LDI r2, 482
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
