; DESCRIPTION: Places a purple line segment connecting (408, 93) to (253, 161).
; PLAN: r0=408(x1), r1=93(y1), r2=253(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 93
LDI r2, 253
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
