; DESCRIPTION: Renders a blue line between points (215, 192) and (337, 157).
; PLAN: r0=215(x1), r1=192(y1), r2=337(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 192
LDI r2, 337
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
