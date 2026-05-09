; DESCRIPTION: Places a blue line segment connecting (492, 111) to (110, 144).
; PLAN: r0=492(x1), r1=111(y1), r2=110(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 111
LDI r2, 110
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
