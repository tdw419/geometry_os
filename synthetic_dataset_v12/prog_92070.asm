; DESCRIPTION: Places a purple line segment connecting (103, 249) to (175, 179).
; PLAN: r0=103(x1), r1=249(y1), r2=175(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 249
LDI r2, 175
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
