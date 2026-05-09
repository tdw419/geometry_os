; DESCRIPTION: Places a blue line segment connecting (65, 193) to (256, 157).
; PLAN: r0=65(x1), r1=193(y1), r2=256(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 193
LDI r2, 256
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
