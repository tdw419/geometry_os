; DESCRIPTION: Renders a yellow line between points (82, 175) and (101, 7).
; PLAN: r0=82(x1), r1=175(y1), r2=101(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 175
LDI r2, 101
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
