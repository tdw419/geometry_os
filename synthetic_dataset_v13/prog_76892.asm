; DESCRIPTION: Draws a blue line from (431, 48) to (32, 84).
; PLAN: r0=431(x1), r1=48(y1), r2=32(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 48
LDI r2, 32
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
