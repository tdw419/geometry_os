; DESCRIPTION: Places a cyan line segment connecting (89, 80) to (497, 88).
; PLAN: r0=89(x1), r1=80(y1), r2=497(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 80
LDI r2, 497
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
