; DESCRIPTION: Draws a purple line from (354, 210) to (136, 249).
; PLAN: r0=354(x1), r1=210(y1), r2=136(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 210
LDI r2, 136
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
