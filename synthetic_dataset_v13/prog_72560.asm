; DESCRIPTION: Renders a orange line between points (27, 28) and (438, 76).
; PLAN: r0=27(x1), r1=28(y1), r2=438(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 28
LDI r2, 438
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
