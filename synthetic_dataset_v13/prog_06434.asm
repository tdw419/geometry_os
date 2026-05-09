; DESCRIPTION: Renders a blue line between points (61, 56) and (431, 32).
; PLAN: r0=61(x1), r1=56(y1), r2=431(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 56
LDI r2, 431
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
