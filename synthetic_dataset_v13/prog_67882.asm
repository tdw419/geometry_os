; DESCRIPTION: Renders a red line between points (265, 182) and (217, 52).
; PLAN: r0=265(x1), r1=182(y1), r2=217(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 182
LDI r2, 217
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
