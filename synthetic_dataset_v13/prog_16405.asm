; DESCRIPTION: Renders a cyan line between points (483, 74) and (155, 76).
; PLAN: r0=483(x1), r1=74(y1), r2=155(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 74
LDI r2, 155
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
