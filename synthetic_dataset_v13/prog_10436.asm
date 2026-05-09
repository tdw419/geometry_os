; DESCRIPTION: Renders a cyan line between points (233, 134) and (109, 106).
; PLAN: r0=233(x1), r1=134(y1), r2=109(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 134
LDI r2, 109
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
