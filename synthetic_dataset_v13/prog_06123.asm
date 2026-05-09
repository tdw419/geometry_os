; DESCRIPTION: Renders a cyan line between points (75, 158) and (250, 80).
; PLAN: r0=75(x1), r1=158(y1), r2=250(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 158
LDI r2, 250
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
