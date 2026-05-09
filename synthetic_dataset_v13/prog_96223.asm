; DESCRIPTION: Draws a yellow line from (503, 79) to (291, 2).
; PLAN: r0=503(x1), r1=79(y1), r2=291(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 79
LDI r2, 291
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
