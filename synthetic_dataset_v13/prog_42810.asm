; DESCRIPTION: Renders a blue line between points (222, 238) and (63, 236).
; PLAN: r0=222(x1), r1=238(y1), r2=63(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 238
LDI r2, 63
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
