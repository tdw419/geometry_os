; DESCRIPTION: Renders a white line between points (244, 246) and (181, 35).
; PLAN: r0=244(x1), r1=246(y1), r2=181(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 246
LDI r2, 181
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
