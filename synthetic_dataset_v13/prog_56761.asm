; DESCRIPTION: Draws a purple line from (227, 141) to (295, 28).
; PLAN: r0=227(x1), r1=141(y1), r2=295(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 141
LDI r2, 295
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
