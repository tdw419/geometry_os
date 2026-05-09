; DESCRIPTION: Renders a yellow line between points (35, 6) and (167, 91).
; PLAN: r0=35(x1), r1=6(y1), r2=167(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 6
LDI r2, 167
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
