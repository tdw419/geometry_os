; DESCRIPTION: Draws a yellow line from (381, 15) to (205, 88).
; PLAN: r0=381(x1), r1=15(y1), r2=205(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 15
LDI r2, 205
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
