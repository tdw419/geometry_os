; DESCRIPTION: Draws a black line from (499, 216) to (136, 60).
; PLAN: r0=499(x1), r1=216(y1), r2=136(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 216
LDI r2, 136
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
