; DESCRIPTION: Draws a red line from (104, 109) to (491, 184).
; PLAN: r0=104(x1), r1=109(y1), r2=491(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 109
LDI r2, 491
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
