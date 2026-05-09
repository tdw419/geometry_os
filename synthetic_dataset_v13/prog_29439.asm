; DESCRIPTION: Places a purple line segment connecting (424, 76) to (284, 137).
; PLAN: r0=424(x1), r1=76(y1), r2=284(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 76
LDI r2, 284
LDI r3, 137
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
