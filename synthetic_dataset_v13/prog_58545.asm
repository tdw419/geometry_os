; DESCRIPTION: Draws a purple line from (33, 157) to (16, 14).
; PLAN: r0=33(x1), r1=157(y1), r2=16(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 157
LDI r2, 16
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
