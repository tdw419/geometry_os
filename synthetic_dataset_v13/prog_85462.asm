; DESCRIPTION: Renders a white line between points (303, 141) and (402, 82).
; PLAN: r0=303(x1), r1=141(y1), r2=402(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 141
LDI r2, 402
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
