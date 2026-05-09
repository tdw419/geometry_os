; DESCRIPTION: Draws a black line from (72, 40) to (274, 97).
; PLAN: r0=72(x1), r1=40(y1), r2=274(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 40
LDI r2, 274
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
