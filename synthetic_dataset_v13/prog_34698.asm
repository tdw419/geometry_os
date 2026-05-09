; DESCRIPTION: Places a cyan line segment connecting (29, 192) to (85, 31).
; PLAN: r0=29(x1), r1=192(y1), r2=85(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 192
LDI r2, 85
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
