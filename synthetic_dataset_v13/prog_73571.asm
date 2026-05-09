; DESCRIPTION: Places a purple line segment connecting (444, 213) to (347, 181).
; PLAN: r0=444(x1), r1=213(y1), r2=347(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 213
LDI r2, 347
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
