; DESCRIPTION: Draws a black line from (268, 135) to (147, 251).
; PLAN: r0=268(x1), r1=135(y1), r2=147(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 135
LDI r2, 147
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
