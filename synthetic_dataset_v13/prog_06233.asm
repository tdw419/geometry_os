; DESCRIPTION: Draws a purple line from (141, 22) to (309, 125).
; PLAN: r0=141(x1), r1=22(y1), r2=309(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 22
LDI r2, 309
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
