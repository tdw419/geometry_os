; DESCRIPTION: Renders a red line between points (3, 60) and (163, 166).
; PLAN: r0=3(x1), r1=60(y1), r2=163(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 60
LDI r2, 163
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
