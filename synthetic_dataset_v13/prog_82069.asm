; DESCRIPTION: Renders a red line between points (358, 182) and (219, 60).
; PLAN: r0=358(x1), r1=182(y1), r2=219(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 182
LDI r2, 219
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
