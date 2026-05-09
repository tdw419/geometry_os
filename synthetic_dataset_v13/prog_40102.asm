; DESCRIPTION: Renders a white line between points (121, 142) and (498, 229).
; PLAN: r0=121(x1), r1=142(y1), r2=498(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 142
LDI r2, 498
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
