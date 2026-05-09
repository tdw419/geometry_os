; DESCRIPTION: Draws a orange line from (291, 13) to (418, 146).
; PLAN: r0=291(x1), r1=13(y1), r2=418(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 13
LDI r2, 418
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
