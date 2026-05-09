; DESCRIPTION: Renders a orange line between points (150, 58) and (438, 221).
; PLAN: r0=150(x1), r1=58(y1), r2=438(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 58
LDI r2, 438
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
