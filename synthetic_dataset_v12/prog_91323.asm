; DESCRIPTION: Draws a black line from (28, 104) to (34, 159).
; PLAN: r0=28(x1), r1=104(y1), r2=34(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 104
LDI r2, 34
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
