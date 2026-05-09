; DESCRIPTION: Draws a purple line from (394, 230) to (395, 79).
; PLAN: r0=394(x1), r1=230(y1), r2=395(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 230
LDI r2, 395
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
