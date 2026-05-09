; DESCRIPTION: Places a yellow line segment connecting (172, 188) to (415, 74).
; PLAN: r0=172(x1), r1=188(y1), r2=415(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 188
LDI r2, 415
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
