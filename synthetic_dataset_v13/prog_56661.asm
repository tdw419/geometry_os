; DESCRIPTION: Draws a blue line from (247, 154) to (84, 81).
; PLAN: r0=247(x1), r1=154(y1), r2=84(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 154
LDI r2, 84
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
