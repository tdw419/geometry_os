; DESCRIPTION: Renders a red line between points (393, 182) and (356, 230).
; PLAN: r0=393(x1), r1=182(y1), r2=356(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 182
LDI r2, 356
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
