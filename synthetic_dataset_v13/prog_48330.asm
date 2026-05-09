; DESCRIPTION: Renders a green line between points (318, 204) and (181, 70).
; PLAN: r0=318(x1), r1=204(y1), r2=181(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 204
LDI r2, 181
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
