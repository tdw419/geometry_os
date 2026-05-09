; DESCRIPTION: Renders a red line between points (264, 117) and (341, 44).
; PLAN: r0=264(x1), r1=117(y1), r2=341(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 117
LDI r2, 341
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
