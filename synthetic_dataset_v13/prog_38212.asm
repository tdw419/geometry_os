; DESCRIPTION: Draws a purple line from (198, 62) to (113, 138).
; PLAN: r0=198(x1), r1=62(y1), r2=113(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 62
LDI r2, 113
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
