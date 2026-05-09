; DESCRIPTION: Renders a cyan line between points (248, 174) and (184, 251).
; PLAN: r0=248(x1), r1=174(y1), r2=184(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 174
LDI r2, 184
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
