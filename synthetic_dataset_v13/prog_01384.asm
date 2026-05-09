; DESCRIPTION: Places a cyan line segment connecting (36, 217) to (483, 65).
; PLAN: r0=36(x1), r1=217(y1), r2=483(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 217
LDI r2, 483
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
