; DESCRIPTION: Renders a magenta line between points (478, 115) and (0, 178).
; PLAN: r0=478(x1), r1=115(y1), r2=0(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 115
LDI r2, 0
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
