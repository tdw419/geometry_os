; DESCRIPTION: Places a purple line segment connecting (264, 125) to (331, 240).
; PLAN: r0=264(x1), r1=125(y1), r2=331(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 125
LDI r2, 331
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
