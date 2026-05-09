; DESCRIPTION: Renders a orange line between points (440, 182) and (241, 221).
; PLAN: r0=440(x1), r1=182(y1), r2=241(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 182
LDI r2, 241
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
