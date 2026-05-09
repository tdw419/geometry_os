; DESCRIPTION: Renders a yellow line between points (391, 244) and (134, 123).
; PLAN: r0=391(x1), r1=244(y1), r2=134(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 244
LDI r2, 134
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
