; DESCRIPTION: Renders a white line between points (431, 182) and (75, 214).
; PLAN: r0=431(x1), r1=182(y1), r2=75(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 182
LDI r2, 75
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
