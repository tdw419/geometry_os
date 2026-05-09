; DESCRIPTION: Renders a white line between points (148, 190) and (462, 7).
; PLAN: r0=148(x1), r1=190(y1), r2=462(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 190
LDI r2, 462
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
