; DESCRIPTION: Renders a blue line between points (296, 55) and (371, 205).
; PLAN: r0=296(x1), r1=55(y1), r2=371(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 55
LDI r2, 371
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
