; DESCRIPTION: Renders a cyan line between points (241, 120) and (274, 94).
; PLAN: r0=241(x1), r1=120(y1), r2=274(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 120
LDI r2, 274
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
