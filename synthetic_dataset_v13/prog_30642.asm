; DESCRIPTION: Renders a cyan line between points (89, 198) and (419, 139).
; PLAN: r0=89(x1), r1=198(y1), r2=419(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 198
LDI r2, 419
LDI r3, 139
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
