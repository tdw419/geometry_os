; DESCRIPTION: Renders a white line between points (157, 49) and (254, 98).
; PLAN: r0=157(x1), r1=49(y1), r2=254(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 49
LDI r2, 254
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
