; DESCRIPTION: Renders a orange line between points (183, 234) and (330, 197).
; PLAN: r0=183(x1), r1=234(y1), r2=330(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 234
LDI r2, 330
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
