; DESCRIPTION: Draws a purple line from (171, 32) to (450, 157).
; PLAN: r0=171(x1), r1=32(y1), r2=450(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 32
LDI r2, 450
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
