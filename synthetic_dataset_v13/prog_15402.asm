; DESCRIPTION: Renders a cyan line between points (478, 139) and (199, 217).
; PLAN: r0=478(x1), r1=139(y1), r2=199(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 139
LDI r2, 199
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
