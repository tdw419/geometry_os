; DESCRIPTION: Places a purple line segment connecting (235, 146) to (123, 115).
; PLAN: r0=235(x1), r1=146(y1), r2=123(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 146
LDI r2, 123
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
