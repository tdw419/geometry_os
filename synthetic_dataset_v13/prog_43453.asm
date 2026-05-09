; DESCRIPTION: Draws a purple line from (22, 239) to (126, 155).
; PLAN: r0=22(x1), r1=239(y1), r2=126(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 239
LDI r2, 126
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
