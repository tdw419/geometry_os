; DESCRIPTION: Renders a black line between points (0, 139) and (222, 108).
; PLAN: r0=0(x1), r1=139(y1), r2=222(x2), r3=108(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 139
LDI r2, 222
LDI r3, 108
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
