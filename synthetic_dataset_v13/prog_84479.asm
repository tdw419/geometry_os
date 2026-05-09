; DESCRIPTION: Draws a magenta line from (359, 148) to (178, 104).
; PLAN: r0=359(x1), r1=148(y1), r2=178(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 148
LDI r2, 178
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
