; DESCRIPTION: Renders a cyan line between points (339, 82) and (148, 119).
; PLAN: r0=339(x1), r1=82(y1), r2=148(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 82
LDI r2, 148
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
