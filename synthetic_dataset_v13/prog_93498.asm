; DESCRIPTION: Renders a red line between points (44, 142) and (438, 248).
; PLAN: r0=44(x1), r1=142(y1), r2=438(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 142
LDI r2, 438
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
