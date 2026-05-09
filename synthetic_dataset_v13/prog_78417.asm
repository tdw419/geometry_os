; DESCRIPTION: Renders a yellow line between points (98, 194) and (65, 47).
; PLAN: r0=98(x1), r1=194(y1), r2=65(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 194
LDI r2, 65
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
