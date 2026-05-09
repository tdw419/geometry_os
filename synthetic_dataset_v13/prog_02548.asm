; DESCRIPTION: Renders a red line between points (372, 77) and (505, 63).
; PLAN: r0=372(x1), r1=77(y1), r2=505(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 77
LDI r2, 505
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
