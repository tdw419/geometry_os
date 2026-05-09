; DESCRIPTION: Renders a red line between points (297, 111) and (205, 140).
; PLAN: r0=297(x1), r1=111(y1), r2=205(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 111
LDI r2, 205
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
