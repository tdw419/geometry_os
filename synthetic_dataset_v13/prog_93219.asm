; DESCRIPTION: Draws a magenta line from (227, 210) to (465, 15).
; PLAN: r0=227(x1), r1=210(y1), r2=465(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 210
LDI r2, 465
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
