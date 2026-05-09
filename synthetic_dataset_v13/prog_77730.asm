; DESCRIPTION: Draws a yellow line from (430, 139) to (347, 132).
; PLAN: r0=430(x1), r1=139(y1), r2=347(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 139
LDI r2, 347
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
