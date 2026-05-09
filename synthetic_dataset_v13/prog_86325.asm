; DESCRIPTION: Draws a purple line from (424, 125) to (233, 46).
; PLAN: r0=424(x1), r1=125(y1), r2=233(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 125
LDI r2, 233
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
