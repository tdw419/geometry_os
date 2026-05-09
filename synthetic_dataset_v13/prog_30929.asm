; DESCRIPTION: Renders a cyan line between points (423, 129) and (98, 145).
; PLAN: r0=423(x1), r1=129(y1), r2=98(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 129
LDI r2, 98
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
