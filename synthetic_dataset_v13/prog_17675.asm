; DESCRIPTION: Renders a yellow line between points (127, 101) and (331, 9).
; PLAN: r0=127(x1), r1=101(y1), r2=331(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 101
LDI r2, 331
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
