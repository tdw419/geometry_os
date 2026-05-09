; DESCRIPTION: Draws a magenta line from (101, 109) to (249, 148).
; PLAN: r0=101(x1), r1=109(y1), r2=249(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 109
LDI r2, 249
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
