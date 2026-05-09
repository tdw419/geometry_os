; DESCRIPTION: Renders a white line between points (58, 25) and (5, 237).
; PLAN: r0=58(x1), r1=25(y1), r2=5(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 25
LDI r2, 5
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
