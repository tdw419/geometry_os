; DESCRIPTION: Places a purple line segment connecting (310, 208) to (340, 160).
; PLAN: r0=310(x1), r1=208(y1), r2=340(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 208
LDI r2, 340
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
