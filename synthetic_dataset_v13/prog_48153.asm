; DESCRIPTION: Renders a red line between points (270, 17) and (181, 83).
; PLAN: r0=270(x1), r1=17(y1), r2=181(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 17
LDI r2, 181
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
