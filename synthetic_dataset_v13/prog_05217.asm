; DESCRIPTION: Draws a blue line from (86, 62) to (415, 133).
; PLAN: r0=86(x1), r1=62(y1), r2=415(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 62
LDI r2, 415
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
