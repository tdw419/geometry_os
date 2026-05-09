; DESCRIPTION: Renders a red line between points (440, 24) and (265, 217).
; PLAN: r0=440(x1), r1=24(y1), r2=265(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 24
LDI r2, 265
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
