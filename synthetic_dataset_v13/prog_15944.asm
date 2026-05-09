; DESCRIPTION: Renders a cyan line between points (248, 227) and (62, 248).
; PLAN: r0=248(x1), r1=227(y1), r2=62(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 227
LDI r2, 62
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
