; DESCRIPTION: Draws a green line from (159, 15) to (129, 60).
; PLAN: r0=159(x1), r1=15(y1), r2=129(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 15
LDI r2, 129
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
