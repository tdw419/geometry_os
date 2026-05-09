; DESCRIPTION: Renders a orange line between points (21, 91) and (468, 249).
; PLAN: r0=21(x1), r1=91(y1), r2=468(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 91
LDI r2, 468
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
