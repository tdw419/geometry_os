; DESCRIPTION: Renders a red line between points (151, 8) and (265, 83).
; PLAN: r0=151(x1), r1=8(y1), r2=265(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 8
LDI r2, 265
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
