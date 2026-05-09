; DESCRIPTION: Draws a orange line from (104, 114) to (403, 73).
; PLAN: r0=104(x1), r1=114(y1), r2=403(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 114
LDI r2, 403
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
