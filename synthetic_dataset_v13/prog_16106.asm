; DESCRIPTION: Draws a orange line from (196, 104) to (58, 180).
; PLAN: r0=196(x1), r1=104(y1), r2=58(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 104
LDI r2, 58
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
