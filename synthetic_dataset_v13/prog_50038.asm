; DESCRIPTION: Draws a purple line from (297, 237) to (303, 243).
; PLAN: r0=297(x1), r1=237(y1), r2=303(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 237
LDI r2, 303
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
