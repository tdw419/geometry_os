; DESCRIPTION: Renders a cyan line between points (241, 160) and (251, 216).
; PLAN: r0=241(x1), r1=160(y1), r2=251(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 160
LDI r2, 251
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
