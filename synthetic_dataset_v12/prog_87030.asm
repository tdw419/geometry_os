; DESCRIPTION: Renders a red line between points (24, 229) and (438, 45).
; PLAN: r0=24(x1), r1=229(y1), r2=438(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 229
LDI r2, 438
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
