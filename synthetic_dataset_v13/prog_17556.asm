; DESCRIPTION: Renders a yellow line between points (475, 109) and (406, 149).
; PLAN: r0=475(x1), r1=109(y1), r2=406(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 109
LDI r2, 406
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
