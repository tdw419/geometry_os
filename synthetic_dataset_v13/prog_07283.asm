; DESCRIPTION: Renders a green line between points (204, 175) and (335, 45).
; PLAN: r0=204(x1), r1=175(y1), r2=335(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 175
LDI r2, 335
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
