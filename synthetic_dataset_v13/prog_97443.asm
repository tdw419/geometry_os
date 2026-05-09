; DESCRIPTION: Draws a purple line from (347, 90) to (304, 234).
; PLAN: r0=347(x1), r1=90(y1), r2=304(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 90
LDI r2, 304
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
