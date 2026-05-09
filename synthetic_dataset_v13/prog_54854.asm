; DESCRIPTION: Draws a black line from (153, 17) to (43, 240).
; PLAN: r0=153(x1), r1=17(y1), r2=43(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 17
LDI r2, 43
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
