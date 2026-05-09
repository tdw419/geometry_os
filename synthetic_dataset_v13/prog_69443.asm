; DESCRIPTION: Draws a black line from (263, 104) to (364, 227).
; PLAN: r0=263(x1), r1=104(y1), r2=364(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 104
LDI r2, 364
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
