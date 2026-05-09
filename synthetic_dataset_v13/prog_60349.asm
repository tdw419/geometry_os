; DESCRIPTION: Renders a red line between points (431, 156) and (331, 33).
; PLAN: r0=431(x1), r1=156(y1), r2=331(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 156
LDI r2, 331
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
