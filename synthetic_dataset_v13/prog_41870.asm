; DESCRIPTION: Renders a yellow line between points (31, 91) and (23, 199).
; PLAN: r0=31(x1), r1=91(y1), r2=23(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 91
LDI r2, 23
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
