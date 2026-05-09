; DESCRIPTION: Places a red line segment connecting (495, 23) to (86, 197).
; PLAN: r0=495(x1), r1=23(y1), r2=86(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 23
LDI r2, 86
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
