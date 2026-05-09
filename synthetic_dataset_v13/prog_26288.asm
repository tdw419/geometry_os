; DESCRIPTION: Renders a purple line between points (455, 230) and (185, 215).
; PLAN: r0=455(x1), r1=230(y1), r2=185(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 230
LDI r2, 185
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
