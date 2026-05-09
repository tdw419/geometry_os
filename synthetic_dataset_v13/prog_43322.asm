; DESCRIPTION: Renders a blue line between points (85, 32) and (236, 157).
; PLAN: r0=85(x1), r1=32(y1), r2=236(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 32
LDI r2, 236
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
