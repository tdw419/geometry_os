; DESCRIPTION: Renders a yellow line between points (245, 206) and (438, 78).
; PLAN: r0=245(x1), r1=206(y1), r2=438(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 206
LDI r2, 438
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
