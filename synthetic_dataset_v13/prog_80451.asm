; DESCRIPTION: Renders a blue line between points (361, 54) and (240, 244).
; PLAN: r0=361(x1), r1=54(y1), r2=240(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 54
LDI r2, 240
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
