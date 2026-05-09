; DESCRIPTION: Places a purple line segment connecting (306, 214) to (151, 234).
; PLAN: r0=306(x1), r1=214(y1), r2=151(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 214
LDI r2, 151
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
