; DESCRIPTION: Renders a yellow line between points (99, 104) and (127, 39).
; PLAN: r0=99(x1), r1=104(y1), r2=127(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 104
LDI r2, 127
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
