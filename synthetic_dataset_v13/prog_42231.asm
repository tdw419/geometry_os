; DESCRIPTION: Renders a cyan line between points (334, 158) and (226, 50).
; PLAN: r0=334(x1), r1=158(y1), r2=226(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 158
LDI r2, 226
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
