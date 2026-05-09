; DESCRIPTION: Places a cyan line segment connecting (451, 8) to (341, 241).
; PLAN: r0=451(x1), r1=8(y1), r2=341(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 8
LDI r2, 341
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
