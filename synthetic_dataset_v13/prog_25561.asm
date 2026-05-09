; DESCRIPTION: Renders a white line between points (238, 141) and (491, 254).
; PLAN: r0=238(x1), r1=141(y1), r2=491(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 141
LDI r2, 491
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
