; DESCRIPTION: Renders a red line between points (248, 61) and (230, 177).
; PLAN: r0=248(x1), r1=61(y1), r2=230(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 61
LDI r2, 230
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
