; DESCRIPTION: Renders a green line between points (248, 37) and (335, 82).
; PLAN: r0=248(x1), r1=37(y1), r2=335(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 37
LDI r2, 335
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
