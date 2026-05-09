; DESCRIPTION: Renders a white line between points (304, 199) and (359, 139).
; PLAN: r0=304(x1), r1=199(y1), r2=359(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 199
LDI r2, 359
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
