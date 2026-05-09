; DESCRIPTION: Draws a blue line from (424, 115) to (17, 170).
; PLAN: r0=424(x1), r1=115(y1), r2=17(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 115
LDI r2, 17
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
