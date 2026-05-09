; DESCRIPTION: Renders a yellow line between points (302, 182) and (203, 6).
; PLAN: r0=302(x1), r1=182(y1), r2=203(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 182
LDI r2, 203
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
