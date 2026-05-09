; DESCRIPTION: Draws a black line from (204, 165) to (252, 102).
; PLAN: r0=204(x1), r1=165(y1), r2=252(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 165
LDI r2, 252
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
