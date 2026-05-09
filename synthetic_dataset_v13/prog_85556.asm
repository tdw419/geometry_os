; DESCRIPTION: Places a cyan line segment connecting (442, 49) to (129, 99).
; PLAN: r0=442(x1), r1=49(y1), r2=129(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 49
LDI r2, 129
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
