; DESCRIPTION: Places a purple line segment connecting (181, 221) to (480, 136).
; PLAN: r0=181(x1), r1=221(y1), r2=480(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 221
LDI r2, 480
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
