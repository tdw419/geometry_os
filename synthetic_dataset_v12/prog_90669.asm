; DESCRIPTION: Draws a magenta line from (135, 148) to (35, 206).
; PLAN: r0=135(x1), r1=148(y1), r2=35(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 148
LDI r2, 35
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
