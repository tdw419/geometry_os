; DESCRIPTION: Places a purple line segment connecting (160, 141) to (245, 203).
; PLAN: r0=160(x1), r1=141(y1), r2=245(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 141
LDI r2, 245
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
