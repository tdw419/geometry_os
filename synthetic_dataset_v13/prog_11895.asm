; DESCRIPTION: Renders a red line between points (385, 40) and (139, 8).
; PLAN: r0=385(x1), r1=40(y1), r2=139(x2), r3=8(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 40
LDI r2, 139
LDI r3, 8
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
