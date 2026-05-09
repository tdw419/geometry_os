; DESCRIPTION: Places a cyan line segment connecting (504, 37) to (430, 94).
; PLAN: r0=504(x1), r1=37(y1), r2=430(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 37
LDI r2, 430
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
