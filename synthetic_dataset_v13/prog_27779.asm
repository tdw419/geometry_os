; DESCRIPTION: Places a purple line segment connecting (107, 214) to (165, 168).
; PLAN: r0=107(x1), r1=214(y1), r2=165(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 214
LDI r2, 165
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
