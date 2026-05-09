; DESCRIPTION: Places a cyan line segment connecting (381, 94) to (68, 238).
; PLAN: r0=381(x1), r1=94(y1), r2=68(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 94
LDI r2, 68
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
