; DESCRIPTION: Places a cyan line segment connecting (130, 22) to (62, 238).
; PLAN: r0=130(x1), r1=22(y1), r2=62(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 22
LDI r2, 62
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
