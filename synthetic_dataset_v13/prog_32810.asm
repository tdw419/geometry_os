; DESCRIPTION: Renders a red line between points (475, 182) and (375, 208).
; PLAN: r0=475(x1), r1=182(y1), r2=375(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 182
LDI r2, 375
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
