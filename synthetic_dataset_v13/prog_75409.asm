; DESCRIPTION: Renders a white line between points (14, 164) and (58, 102).
; PLAN: r0=14(x1), r1=164(y1), r2=58(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 164
LDI r2, 58
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
