; DESCRIPTION: Renders a yellow line between points (75, 43) and (167, 58).
; PLAN: r0=75(x1), r1=43(y1), r2=167(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 43
LDI r2, 167
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
