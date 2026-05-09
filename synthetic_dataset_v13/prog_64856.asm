; DESCRIPTION: Renders a cyan line between points (96, 83) and (47, 119).
; PLAN: r0=96(x1), r1=83(y1), r2=47(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 83
LDI r2, 47
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
