; DESCRIPTION: Draws a purple line from (172, 9) to (209, 180).
; PLAN: r0=172(x1), r1=9(y1), r2=209(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 9
LDI r2, 209
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
