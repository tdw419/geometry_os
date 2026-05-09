; DESCRIPTION: Renders a cyan line between points (478, 140) and (100, 153).
; PLAN: r0=478(x1), r1=140(y1), r2=100(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 140
LDI r2, 100
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
