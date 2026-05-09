; DESCRIPTION: Draws a black line from (306, 211) to (490, 163).
; PLAN: r0=306(x1), r1=211(y1), r2=490(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 211
LDI r2, 490
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
