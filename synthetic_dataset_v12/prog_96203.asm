; DESCRIPTION: Renders a cyan line between points (501, 251) and (124, 102).
; PLAN: r0=501(x1), r1=251(y1), r2=124(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 251
LDI r2, 124
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
