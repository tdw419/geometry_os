; DESCRIPTION: Places a blue line segment connecting (135, 246) to (344, 247).
; PLAN: r0=135(x1), r1=246(y1), r2=344(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 246
LDI r2, 344
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
