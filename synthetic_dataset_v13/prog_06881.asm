; DESCRIPTION: Renders a white line between points (114, 192) and (380, 54).
; PLAN: r0=114(x1), r1=192(y1), r2=380(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 192
LDI r2, 380
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
