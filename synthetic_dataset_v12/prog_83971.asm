; DESCRIPTION: Draws a orange line from (361, 153) to (328, 210).
; PLAN: r0=361(x1), r1=153(y1), r2=328(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 153
LDI r2, 328
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
