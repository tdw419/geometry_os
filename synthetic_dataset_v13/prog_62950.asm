; DESCRIPTION: Renders a cyan line between points (462, 35) and (467, 75).
; PLAN: r0=462(x1), r1=35(y1), r2=467(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 35
LDI r2, 467
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
