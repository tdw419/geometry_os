; DESCRIPTION: Places a cyan line segment connecting (364, 44) to (303, 229).
; PLAN: r0=364(x1), r1=44(y1), r2=303(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 44
LDI r2, 303
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
