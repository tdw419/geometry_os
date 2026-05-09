; DESCRIPTION: Places a purple line segment connecting (90, 185) to (178, 86).
; PLAN: r0=90(x1), r1=185(y1), r2=178(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 185
LDI r2, 178
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
