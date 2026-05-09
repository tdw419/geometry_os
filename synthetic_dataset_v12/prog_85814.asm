; DESCRIPTION: Draws a magenta line from (12, 185) to (371, 100).
; PLAN: r0=12(x1), r1=185(y1), r2=371(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 185
LDI r2, 371
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
