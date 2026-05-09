; DESCRIPTION: Places a cyan line segment connecting (319, 216) to (140, 137).
; PLAN: r0=319(x1), r1=216(y1), r2=140(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 216
LDI r2, 140
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
