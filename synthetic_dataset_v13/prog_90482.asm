; DESCRIPTION: Draws a magenta line from (139, 253) to (108, 79).
; PLAN: r0=139(x1), r1=253(y1), r2=108(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 253
LDI r2, 108
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
