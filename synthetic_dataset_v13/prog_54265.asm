; DESCRIPTION: Renders a cyan line between points (62, 122) and (335, 20).
; PLAN: r0=62(x1), r1=122(y1), r2=335(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 122
LDI r2, 335
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
