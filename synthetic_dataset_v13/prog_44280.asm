; DESCRIPTION: Draws a purple line from (121, 125) to (141, 244).
; PLAN: r0=121(x1), r1=125(y1), r2=141(x2), r3=244(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 125
LDI r2, 141
LDI r3, 244
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
