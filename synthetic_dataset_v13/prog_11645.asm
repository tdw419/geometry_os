; DESCRIPTION: Draws a magenta line from (4, 171) to (337, 123).
; PLAN: r0=4(x1), r1=171(y1), r2=337(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 171
LDI r2, 337
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
