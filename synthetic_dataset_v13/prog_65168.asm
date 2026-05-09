; DESCRIPTION: Renders a yellow line between points (251, 22) and (368, 93).
; PLAN: r0=251(x1), r1=22(y1), r2=368(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 22
LDI r2, 368
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
