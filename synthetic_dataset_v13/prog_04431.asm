; DESCRIPTION: Places a cyan line segment connecting (483, 229) to (186, 23).
; PLAN: r0=483(x1), r1=229(y1), r2=186(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 229
LDI r2, 186
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
