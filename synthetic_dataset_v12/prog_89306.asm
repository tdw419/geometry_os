; DESCRIPTION: Draws a yellow line from (486, 9) to (17, 40).
; PLAN: r0=486(x1), r1=9(y1), r2=17(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 9
LDI r2, 17
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
