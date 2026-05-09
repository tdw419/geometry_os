; DESCRIPTION: Draws a purple line from (209, 95) to (192, 102).
; PLAN: r0=209(x1), r1=95(y1), r2=192(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 95
LDI r2, 192
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
