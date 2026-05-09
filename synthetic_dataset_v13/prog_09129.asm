; DESCRIPTION: Draws a black line from (309, 66) to (67, 163).
; PLAN: r0=309(x1), r1=66(y1), r2=67(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 66
LDI r2, 67
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
