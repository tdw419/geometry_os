; DESCRIPTION: Draws a orange line from (80, 214) to (358, 103).
; PLAN: r0=80(x1), r1=214(y1), r2=358(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 214
LDI r2, 358
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
