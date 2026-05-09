; DESCRIPTION: Renders a yellow line between points (21, 29) and (463, 36).
; PLAN: r0=21(x1), r1=29(y1), r2=463(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 29
LDI r2, 463
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
