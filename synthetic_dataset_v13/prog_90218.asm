; DESCRIPTION: Renders a cyan line between points (124, 129) and (14, 76).
; PLAN: r0=124(x1), r1=129(y1), r2=14(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 129
LDI r2, 14
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
