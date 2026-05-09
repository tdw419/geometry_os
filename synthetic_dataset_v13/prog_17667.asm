; DESCRIPTION: Draws a magenta line from (3, 148) to (505, 0).
; PLAN: r0=3(x1), r1=148(y1), r2=505(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 148
LDI r2, 505
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
