; DESCRIPTION: Places a purple line segment connecting (272, 222) to (173, 157).
; PLAN: r0=272(x1), r1=222(y1), r2=173(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 222
LDI r2, 173
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
