; DESCRIPTION: Renders a cyan line between points (55, 243) and (336, 140).
; PLAN: r0=55(x1), r1=243(y1), r2=336(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 243
LDI r2, 336
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
