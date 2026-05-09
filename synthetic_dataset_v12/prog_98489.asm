; DESCRIPTION: Places a cyan line segment connecting (80, 139) to (116, 18).
; PLAN: r0=80(x1), r1=139(y1), r2=116(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 139
LDI r2, 116
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
