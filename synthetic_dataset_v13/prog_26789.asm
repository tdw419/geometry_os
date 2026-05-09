; DESCRIPTION: Renders a cyan line between points (336, 143) and (462, 2).
; PLAN: r0=336(x1), r1=143(y1), r2=462(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 143
LDI r2, 462
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
