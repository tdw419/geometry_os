; DESCRIPTION: Draws a blue line from (63, 64) to (158, 28).
; PLAN: r0=63(x1), r1=64(y1), r2=158(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 64
LDI r2, 158
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
