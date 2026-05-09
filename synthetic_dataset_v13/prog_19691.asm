; DESCRIPTION: Renders a red line between points (91, 250) and (438, 204).
; PLAN: r0=91(x1), r1=250(y1), r2=438(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 250
LDI r2, 438
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
