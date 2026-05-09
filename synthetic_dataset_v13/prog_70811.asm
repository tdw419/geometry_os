; DESCRIPTION: Draws a purple line from (94, 72) to (474, 237).
; PLAN: r0=94(x1), r1=72(y1), r2=474(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 72
LDI r2, 474
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
