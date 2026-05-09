; DESCRIPTION: Draws a purple line from (409, 235) to (148, 146).
; PLAN: r0=409(x1), r1=235(y1), r2=148(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 235
LDI r2, 148
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
