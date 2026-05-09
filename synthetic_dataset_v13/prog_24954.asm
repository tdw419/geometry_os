; DESCRIPTION: Renders a green line between points (395, 185) and (376, 108).
; PLAN: r0=395(x1), r1=185(y1), r2=376(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 185
LDI r2, 376
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
