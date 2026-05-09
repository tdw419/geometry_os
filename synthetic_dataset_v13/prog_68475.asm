; DESCRIPTION: Draws a purple line from (121, 107) to (265, 237).
; PLAN: r0=121(x1), r1=107(y1), r2=265(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 107
LDI r2, 265
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
