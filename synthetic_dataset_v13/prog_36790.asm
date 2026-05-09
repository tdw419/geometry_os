; DESCRIPTION: Renders a cyan line between points (258, 147) and (335, 62).
; PLAN: r0=258(x1), r1=147(y1), r2=335(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 147
LDI r2, 335
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
