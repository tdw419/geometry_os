; DESCRIPTION: Renders a red line between points (190, 171) and (400, 77).
; PLAN: r0=190(x1), r1=171(y1), r2=400(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 171
LDI r2, 400
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
