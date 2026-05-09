; DESCRIPTION: Renders a orange line between points (423, 170) and (215, 214).
; PLAN: r0=423(x1), r1=170(y1), r2=215(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 170
LDI r2, 215
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
