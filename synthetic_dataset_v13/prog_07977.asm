; DESCRIPTION: Renders a red line between points (375, 111) and (311, 206).
; PLAN: r0=375(x1), r1=111(y1), r2=311(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 111
LDI r2, 311
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
