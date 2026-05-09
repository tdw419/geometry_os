; DESCRIPTION: Draws a white line from (2, 17) to (159, 18).
; PLAN: r0=2(x1), r1=17(y1), r2=159(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 17
LDI r2, 159
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
