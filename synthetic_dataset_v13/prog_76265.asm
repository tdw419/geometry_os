; DESCRIPTION: Draws a purple line from (423, 86) to (474, 166).
; PLAN: r0=423(x1), r1=86(y1), r2=474(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 86
LDI r2, 474
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
