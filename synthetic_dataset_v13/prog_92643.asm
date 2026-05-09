; DESCRIPTION: Draws a blue line from (0, 194) to (28, 32).
; PLAN: r0=0(x1), r1=194(y1), r2=28(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 194
LDI r2, 28
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
