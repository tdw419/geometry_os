; DESCRIPTION: Draws a orange line from (387, 69) to (447, 195).
; PLAN: r0=387(x1), r1=69(y1), r2=447(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 69
LDI r2, 447
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
