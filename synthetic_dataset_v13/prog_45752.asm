; DESCRIPTION: Places a cyan line segment connecting (309, 78) to (80, 158).
; PLAN: r0=309(x1), r1=78(y1), r2=80(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 78
LDI r2, 80
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
