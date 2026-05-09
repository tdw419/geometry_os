; DESCRIPTION: Renders a yellow line between points (509, 119) and (114, 95).
; PLAN: r0=509(x1), r1=119(y1), r2=114(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 119
LDI r2, 114
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
