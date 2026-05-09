; DESCRIPTION: Draws a yellow line from (403, 89) to (104, 181).
; PLAN: r0=403(x1), r1=89(y1), r2=104(x2), r3=181(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 89
LDI r2, 104
LDI r3, 181
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
