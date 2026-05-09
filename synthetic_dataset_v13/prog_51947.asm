; DESCRIPTION: Renders a white line between points (431, 177) and (53, 115).
; PLAN: r0=431(x1), r1=177(y1), r2=53(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 177
LDI r2, 53
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
