; DESCRIPTION: Renders a cyan line between points (104, 243) and (124, 66).
; PLAN: r0=104(x1), r1=243(y1), r2=124(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 243
LDI r2, 124
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
