; DESCRIPTION: Renders a cyan line between points (477, 142) and (336, 106).
; PLAN: r0=477(x1), r1=142(y1), r2=336(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 142
LDI r2, 336
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
