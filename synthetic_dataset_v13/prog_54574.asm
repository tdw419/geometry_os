; DESCRIPTION: Renders a white line between points (167, 119) and (264, 98).
; PLAN: r0=167(x1), r1=119(y1), r2=264(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 119
LDI r2, 264
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
