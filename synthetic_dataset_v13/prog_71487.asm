; DESCRIPTION: Renders a white line between points (14, 227) and (491, 206).
; PLAN: r0=14(x1), r1=227(y1), r2=491(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 227
LDI r2, 491
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
