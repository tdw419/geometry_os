; DESCRIPTION: Draws a black line from (17, 105) to (20, 192).
; PLAN: r0=17(x1), r1=105(y1), r2=20(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 105
LDI r2, 20
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
