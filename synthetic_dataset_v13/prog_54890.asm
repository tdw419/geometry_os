; DESCRIPTION: Renders a yellow line between points (54, 54) and (463, 95).
; PLAN: r0=54(x1), r1=54(y1), r2=463(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 54
LDI r2, 463
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
