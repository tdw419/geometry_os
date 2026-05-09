; DESCRIPTION: Renders a black line between points (35, 182) and (225, 200).
; PLAN: r0=35(x1), r1=182(y1), r2=225(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 182
LDI r2, 225
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
