; DESCRIPTION: Draws a purple line from (340, 230) to (142, 150).
; PLAN: r0=340(x1), r1=230(y1), r2=142(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 230
LDI r2, 142
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
