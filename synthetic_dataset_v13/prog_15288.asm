; DESCRIPTION: Places a cyan line segment connecting (458, 254) to (88, 158).
; PLAN: r0=458(x1), r1=254(y1), r2=88(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 254
LDI r2, 88
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
