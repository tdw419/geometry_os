; DESCRIPTION: Draws a red line from (17, 40) to (322, 13).
; PLAN: r0=17(x1), r1=40(y1), r2=322(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 40
LDI r2, 322
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
