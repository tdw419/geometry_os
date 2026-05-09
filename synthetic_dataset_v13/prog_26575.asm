; DESCRIPTION: Renders a cyan line between points (95, 101) and (76, 238).
; PLAN: r0=95(x1), r1=101(y1), r2=76(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 101
LDI r2, 76
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
