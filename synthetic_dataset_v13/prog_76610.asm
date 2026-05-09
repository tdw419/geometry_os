; DESCRIPTION: Draws a purple line from (446, 74) to (297, 102).
; PLAN: r0=446(x1), r1=74(y1), r2=297(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 74
LDI r2, 297
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
