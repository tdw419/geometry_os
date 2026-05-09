; DESCRIPTION: Renders a yellow line between points (241, 142) and (343, 177).
; PLAN: r0=241(x1), r1=142(y1), r2=343(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 142
LDI r2, 343
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
