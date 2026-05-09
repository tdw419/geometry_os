; DESCRIPTION: Renders a green line between points (139, 154) and (40, 47).
; PLAN: r0=139(x1), r1=154(y1), r2=40(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 154
LDI r2, 40
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
