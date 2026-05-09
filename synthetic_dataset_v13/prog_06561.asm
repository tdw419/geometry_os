; DESCRIPTION: Draws a black line from (427, 67) to (37, 237).
; PLAN: r0=427(x1), r1=67(y1), r2=37(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 67
LDI r2, 37
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
