; DESCRIPTION: Draws a orange line from (215, 218) to (55, 237).
; PLAN: r0=215(x1), r1=218(y1), r2=55(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 218
LDI r2, 55
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
