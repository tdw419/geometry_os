; DESCRIPTION: Draws a magenta line from (269, 15) to (101, 51).
; PLAN: r0=269(x1), r1=15(y1), r2=101(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 15
LDI r2, 101
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
