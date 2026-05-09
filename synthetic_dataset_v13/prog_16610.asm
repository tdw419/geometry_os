; DESCRIPTION: Places a cyan line segment connecting (191, 139) to (451, 156).
; PLAN: r0=191(x1), r1=139(y1), r2=451(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 139
LDI r2, 451
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
