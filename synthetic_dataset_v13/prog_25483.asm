; DESCRIPTION: Places a blue line segment connecting (288, 172) to (191, 144).
; PLAN: r0=288(x1), r1=172(y1), r2=191(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 172
LDI r2, 191
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
