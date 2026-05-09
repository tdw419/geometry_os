; DESCRIPTION: Renders a yellow line between points (363, 134) and (508, 255).
; PLAN: r0=363(x1), r1=134(y1), r2=508(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 134
LDI r2, 508
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
