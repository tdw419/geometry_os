; DESCRIPTION: Draws a purple line from (214, 235) to (426, 141).
; PLAN: r0=214(x1), r1=235(y1), r2=426(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 235
LDI r2, 426
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
