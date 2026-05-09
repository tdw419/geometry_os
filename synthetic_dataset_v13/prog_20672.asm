; DESCRIPTION: Renders a yellow line between points (15, 234) and (106, 47).
; PLAN: r0=15(x1), r1=234(y1), r2=106(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 234
LDI r2, 106
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
