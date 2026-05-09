; DESCRIPTION: Renders a green line between points (31, 188) and (508, 139).
; PLAN: r0=31(x1), r1=188(y1), r2=508(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 188
LDI r2, 508
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
