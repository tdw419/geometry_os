; DESCRIPTION: Renders a yellow line between points (380, 11) and (134, 84).
; PLAN: r0=380(x1), r1=11(y1), r2=134(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 11
LDI r2, 134
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
