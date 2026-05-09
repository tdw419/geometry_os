; DESCRIPTION: Renders a blue line between points (247, 165) and (431, 63).
; PLAN: r0=247(x1), r1=165(y1), r2=431(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 165
LDI r2, 431
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
