; DESCRIPTION: Draws a magenta line from (442, 192) to (377, 194).
; PLAN: r0=442(x1), r1=192(y1), r2=377(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 192
LDI r2, 377
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
