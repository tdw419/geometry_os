; DESCRIPTION: Renders a cyan line between points (458, 199) and (315, 75).
; PLAN: r0=458(x1), r1=199(y1), r2=315(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 199
LDI r2, 315
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
