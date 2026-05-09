; DESCRIPTION: Draws a black line from (204, 27) to (62, 104).
; PLAN: r0=204(x1), r1=27(y1), r2=62(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 27
LDI r2, 62
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
