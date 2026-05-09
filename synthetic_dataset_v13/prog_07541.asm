; DESCRIPTION: Draws a purple line from (471, 74) to (474, 171).
; PLAN: r0=471(x1), r1=74(y1), r2=474(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 74
LDI r2, 474
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
