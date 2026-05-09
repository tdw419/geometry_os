; DESCRIPTION: Places a red line segment connecting (144, 188) to (492, 49).
; PLAN: r0=144(x1), r1=188(y1), r2=492(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 188
LDI r2, 492
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
