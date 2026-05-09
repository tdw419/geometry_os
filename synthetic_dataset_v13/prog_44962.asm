; DESCRIPTION: Draws a purple line from (373, 121) to (273, 218).
; PLAN: r0=373(x1), r1=121(y1), r2=273(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 121
LDI r2, 273
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
