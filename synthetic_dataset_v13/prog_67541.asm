; DESCRIPTION: Places a purple line segment connecting (65, 214) to (229, 7).
; PLAN: r0=65(x1), r1=214(y1), r2=229(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 214
LDI r2, 229
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
