; DESCRIPTION: Renders a white line between points (423, 182) and (141, 32).
; PLAN: r0=423(x1), r1=182(y1), r2=141(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 182
LDI r2, 141
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
