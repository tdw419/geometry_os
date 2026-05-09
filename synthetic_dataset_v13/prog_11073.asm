; DESCRIPTION: Draws a purple line from (86, 106) to (401, 183).
; PLAN: r0=86(x1), r1=106(y1), r2=401(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 106
LDI r2, 401
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
