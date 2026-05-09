; DESCRIPTION: Renders a cyan line between points (304, 22) and (300, 106).
; PLAN: r0=304(x1), r1=22(y1), r2=300(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 22
LDI r2, 300
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
