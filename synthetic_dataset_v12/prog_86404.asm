; DESCRIPTION: Draws a purple line from (82, 207) to (38, 197).
; PLAN: r0=82(x1), r1=207(y1), r2=38(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 207
LDI r2, 38
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
