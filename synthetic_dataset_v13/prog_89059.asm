; DESCRIPTION: Draws a purple line from (204, 53) to (329, 161).
; PLAN: r0=204(x1), r1=53(y1), r2=329(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 53
LDI r2, 329
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
