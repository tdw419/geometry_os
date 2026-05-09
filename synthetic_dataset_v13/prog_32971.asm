; DESCRIPTION: Draws a magenta line from (288, 71) to (101, 44).
; PLAN: r0=288(x1), r1=71(y1), r2=101(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 71
LDI r2, 101
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
