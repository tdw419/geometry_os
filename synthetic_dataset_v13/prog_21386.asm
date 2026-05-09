; DESCRIPTION: Renders a green line between points (217, 177) and (170, 106).
; PLAN: r0=217(x1), r1=177(y1), r2=170(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 177
LDI r2, 170
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
