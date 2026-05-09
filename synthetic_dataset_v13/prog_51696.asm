; DESCRIPTION: Renders a white line between points (164, 141) and (227, 186).
; PLAN: r0=164(x1), r1=141(y1), r2=227(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 141
LDI r2, 227
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
