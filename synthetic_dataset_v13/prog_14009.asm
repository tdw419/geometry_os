; DESCRIPTION: Places a cyan line segment connecting (238, 186) to (364, 45).
; PLAN: r0=238(x1), r1=186(y1), r2=364(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 186
LDI r2, 364
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
