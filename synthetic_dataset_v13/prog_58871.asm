; DESCRIPTION: Renders a yellow line between points (335, 26) and (355, 108).
; PLAN: r0=335(x1), r1=26(y1), r2=355(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 26
LDI r2, 355
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
