; DESCRIPTION: Places a blue line segment connecting (246, 37) to (95, 158).
; PLAN: r0=246(x1), r1=37(y1), r2=95(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 37
LDI r2, 95
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
