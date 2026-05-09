; DESCRIPTION: Renders a black line between points (38, 69) and (439, 248).
; PLAN: r0=38(x1), r1=69(y1), r2=439(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 69
LDI r2, 439
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
