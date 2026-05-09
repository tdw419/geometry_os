; DESCRIPTION: Places a cyan line segment connecting (22, 52) to (85, 96).
; PLAN: r0=22(x1), r1=52(y1), r2=85(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 52
LDI r2, 85
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
