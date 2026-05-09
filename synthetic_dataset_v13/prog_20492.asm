; DESCRIPTION: Draws a blue line from (16, 194) to (345, 79).
; PLAN: r0=16(x1), r1=194(y1), r2=345(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 194
LDI r2, 345
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
