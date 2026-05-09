; DESCRIPTION: Renders a yellow line between points (500, 194) and (468, 159).
; PLAN: r0=500(x1), r1=194(y1), r2=468(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 194
LDI r2, 468
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
