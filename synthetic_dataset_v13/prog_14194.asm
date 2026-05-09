; DESCRIPTION: Places a cyan line segment connecting (162, 105) to (109, 34).
; PLAN: r0=162(x1), r1=105(y1), r2=109(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 105
LDI r2, 109
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
