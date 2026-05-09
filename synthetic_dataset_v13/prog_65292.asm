; DESCRIPTION: Draws a purple line from (328, 139) to (161, 164).
; PLAN: r0=328(x1), r1=139(y1), r2=161(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 139
LDI r2, 161
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
