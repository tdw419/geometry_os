; DESCRIPTION: Draws a black line from (106, 66) to (17, 92).
; PLAN: r0=106(x1), r1=66(y1), r2=17(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 66
LDI r2, 17
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
