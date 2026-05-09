; DESCRIPTION: Draws a purple line from (460, 161) to (258, 188).
; PLAN: r0=460(x1), r1=161(y1), r2=258(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 161
LDI r2, 258
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
