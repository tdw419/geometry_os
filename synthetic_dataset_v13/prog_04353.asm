; DESCRIPTION: Places a purple line segment connecting (354, 223) to (318, 9).
; PLAN: r0=354(x1), r1=223(y1), r2=318(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 223
LDI r2, 318
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
