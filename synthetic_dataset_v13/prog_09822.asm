; DESCRIPTION: Places a cyan line segment connecting (309, 34) to (504, 222).
; PLAN: r0=309(x1), r1=34(y1), r2=504(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 34
LDI r2, 504
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
