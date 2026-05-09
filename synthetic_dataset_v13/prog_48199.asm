; DESCRIPTION: Places a purple line segment connecting (459, 87) to (298, 234).
; PLAN: r0=459(x1), r1=87(y1), r2=298(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 87
LDI r2, 298
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
