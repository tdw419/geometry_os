; DESCRIPTION: Draws a purple line from (264, 154) to (287, 178).
; PLAN: r0=264(x1), r1=154(y1), r2=287(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 154
LDI r2, 287
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
