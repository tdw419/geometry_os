; DESCRIPTION: Draws a magenta line from (183, 158) to (412, 17).
; PLAN: r0=183(x1), r1=158(y1), r2=412(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 158
LDI r2, 412
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
