; DESCRIPTION: Renders a yellow line between points (81, 0) and (306, 117).
; PLAN: r0=81(x1), r1=0(y1), r2=306(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 0
LDI r2, 306
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
