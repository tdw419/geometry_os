; DESCRIPTION: Draws a orange line from (249, 38) to (361, 253).
; PLAN: r0=249(x1), r1=38(y1), r2=361(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 38
LDI r2, 361
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
