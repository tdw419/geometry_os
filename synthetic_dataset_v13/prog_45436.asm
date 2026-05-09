; DESCRIPTION: Renders a red line between points (265, 189) and (489, 60).
; PLAN: r0=265(x1), r1=189(y1), r2=489(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 189
LDI r2, 489
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
