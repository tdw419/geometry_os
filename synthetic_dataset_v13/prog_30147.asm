; DESCRIPTION: Places a cyan line segment connecting (483, 25) to (62, 92).
; PLAN: r0=483(x1), r1=25(y1), r2=62(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 25
LDI r2, 62
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
