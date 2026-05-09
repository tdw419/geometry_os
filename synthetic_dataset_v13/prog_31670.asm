; DESCRIPTION: Draws a red line from (390, 17) to (370, 87).
; PLAN: r0=390(x1), r1=17(y1), r2=370(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 17
LDI r2, 370
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
