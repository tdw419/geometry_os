; DESCRIPTION: Renders a cyan line between points (439, 105) and (378, 161).
; PLAN: r0=439(x1), r1=105(y1), r2=378(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 105
LDI r2, 378
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
