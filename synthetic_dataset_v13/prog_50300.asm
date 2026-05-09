; DESCRIPTION: Draws a orange line from (130, 1) to (238, 197).
; PLAN: r0=130(x1), r1=1(y1), r2=238(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 1
LDI r2, 238
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
