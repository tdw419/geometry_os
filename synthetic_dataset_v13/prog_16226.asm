; DESCRIPTION: Places a orange line segment connecting (241, 197) to (245, 119).
; PLAN: r0=241(x1), r1=197(y1), r2=245(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 197
LDI r2, 245
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
