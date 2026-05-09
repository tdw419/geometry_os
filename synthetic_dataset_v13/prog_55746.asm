; DESCRIPTION: Renders a green line between points (254, 61) and (116, 49).
; PLAN: r0=254(x1), r1=61(y1), r2=116(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 61
LDI r2, 116
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
