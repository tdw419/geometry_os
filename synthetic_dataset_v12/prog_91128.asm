; DESCRIPTION: Renders a orange line between points (159, 206) and (272, 5).
; PLAN: r0=159(x1), r1=206(y1), r2=272(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 206
LDI r2, 272
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
