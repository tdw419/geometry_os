; DESCRIPTION: Draws a orange line from (507, 113) to (421, 86).
; PLAN: r0=507(x1), r1=113(y1), r2=421(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 113
LDI r2, 421
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
