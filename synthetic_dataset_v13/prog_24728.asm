; DESCRIPTION: Renders a white line between points (309, 125) and (22, 129).
; PLAN: r0=309(x1), r1=125(y1), r2=22(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 125
LDI r2, 22
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
