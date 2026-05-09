; DESCRIPTION: Renders a blue line between points (200, 234) and (128, 141).
; PLAN: r0=200(x1), r1=234(y1), r2=128(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 234
LDI r2, 128
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
