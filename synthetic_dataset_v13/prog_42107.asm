; DESCRIPTION: Renders a yellow line between points (264, 143) and (102, 157).
; PLAN: r0=264(x1), r1=143(y1), r2=102(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 143
LDI r2, 102
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
