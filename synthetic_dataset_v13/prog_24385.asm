; DESCRIPTION: Renders a black line between points (379, 249) and (334, 70).
; PLAN: r0=379(x1), r1=249(y1), r2=334(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 249
LDI r2, 334
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
