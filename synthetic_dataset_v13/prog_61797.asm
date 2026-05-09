; DESCRIPTION: Places a yellow line segment connecting (222, 78) to (434, 135).
; PLAN: r0=222(x1), r1=78(y1), r2=434(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 78
LDI r2, 434
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
