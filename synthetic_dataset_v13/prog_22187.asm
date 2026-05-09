; DESCRIPTION: Draws a purple line from (235, 181) to (154, 109).
; PLAN: r0=235(x1), r1=181(y1), r2=154(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 181
LDI r2, 154
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
