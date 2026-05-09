; DESCRIPTION: Draws a purple line from (61, 129) to (347, 58).
; PLAN: r0=61(x1), r1=129(y1), r2=347(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 129
LDI r2, 347
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
