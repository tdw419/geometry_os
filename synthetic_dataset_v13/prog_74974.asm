; DESCRIPTION: Renders a cyan line between points (193, 110) and (3, 68).
; PLAN: r0=193(x1), r1=110(y1), r2=3(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 110
LDI r2, 3
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
