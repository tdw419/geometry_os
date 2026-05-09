; DESCRIPTION: Draws a yellow line from (105, 100) to (272, 49).
; PLAN: r0=105(x1), r1=100(y1), r2=272(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 100
LDI r2, 272
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
