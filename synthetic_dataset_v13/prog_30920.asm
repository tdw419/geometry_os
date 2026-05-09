; DESCRIPTION: Draws a purple line from (491, 114) to (205, 218).
; PLAN: r0=491(x1), r1=114(y1), r2=205(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 114
LDI r2, 205
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
