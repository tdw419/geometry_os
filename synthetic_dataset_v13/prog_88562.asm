; DESCRIPTION: Draws a orange line from (49, 32) to (258, 214).
; PLAN: r0=49(x1), r1=32(y1), r2=258(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 32
LDI r2, 258
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
