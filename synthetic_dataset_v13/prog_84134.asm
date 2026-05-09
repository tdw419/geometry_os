; DESCRIPTION: Places a purple line segment connecting (444, 219) to (125, 187).
; PLAN: r0=444(x1), r1=219(y1), r2=125(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 219
LDI r2, 125
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
