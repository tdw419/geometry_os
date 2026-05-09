; DESCRIPTION: Draws a magenta line from (193, 101) to (219, 255).
; PLAN: r0=193(x1), r1=101(y1), r2=219(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 101
LDI r2, 219
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
