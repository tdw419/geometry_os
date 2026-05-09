; DESCRIPTION: Renders a cyan line between points (137, 2) and (343, 99).
; PLAN: r0=137(x1), r1=2(y1), r2=343(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 2
LDI r2, 343
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
