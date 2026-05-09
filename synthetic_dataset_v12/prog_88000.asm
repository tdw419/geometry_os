; DESCRIPTION: Renders a yellow line between points (11, 47) and (0, 156).
; PLAN: r0=11(x1), r1=47(y1), r2=0(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 47
LDI r2, 0
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
