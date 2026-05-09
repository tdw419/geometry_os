; DESCRIPTION: Draws a purple line from (8, 151) to (450, 179).
; PLAN: r0=8(x1), r1=151(y1), r2=450(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 151
LDI r2, 450
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
