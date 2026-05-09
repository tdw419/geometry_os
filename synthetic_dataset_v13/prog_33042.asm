; DESCRIPTION: Draws a orange line from (278, 214) to (65, 14).
; PLAN: r0=278(x1), r1=214(y1), r2=65(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 214
LDI r2, 65
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
