; DESCRIPTION: Draws a purple line from (191, 230) to (395, 98).
; PLAN: r0=191(x1), r1=230(y1), r2=395(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 230
LDI r2, 395
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
