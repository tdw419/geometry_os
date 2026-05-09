; DESCRIPTION: Renders a cyan line between points (495, 85) and (395, 105).
; PLAN: r0=495(x1), r1=85(y1), r2=395(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 85
LDI r2, 395
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
