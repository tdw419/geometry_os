; DESCRIPTION: Renders a yellow line between points (53, 5) and (321, 177).
; PLAN: r0=53(x1), r1=5(y1), r2=321(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 5
LDI r2, 321
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
