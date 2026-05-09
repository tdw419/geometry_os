; DESCRIPTION: Renders a red line between points (386, 182) and (241, 110).
; PLAN: r0=386(x1), r1=182(y1), r2=241(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 182
LDI r2, 241
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
