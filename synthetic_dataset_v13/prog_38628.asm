; DESCRIPTION: Draws a magenta line from (47, 99) to (474, 172).
; PLAN: r0=47(x1), r1=99(y1), r2=474(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 99
LDI r2, 474
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
