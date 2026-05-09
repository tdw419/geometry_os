; DESCRIPTION: Draws a black line from (328, 15) to (129, 211).
; PLAN: r0=328(x1), r1=15(y1), r2=129(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 15
LDI r2, 129
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
