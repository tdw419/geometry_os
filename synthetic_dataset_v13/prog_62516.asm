; DESCRIPTION: Draws a purple line from (507, 244) to (9, 16).
; PLAN: r0=507(x1), r1=244(y1), r2=9(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 244
LDI r2, 9
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
