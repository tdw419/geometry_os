; DESCRIPTION: Places a cyan line segment connecting (88, 34) to (232, 135).
; PLAN: r0=88(x1), r1=34(y1), r2=232(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 34
LDI r2, 232
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
