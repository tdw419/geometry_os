; DESCRIPTION: Places a cyan line segment connecting (483, 40) to (342, 197).
; PLAN: r0=483(x1), r1=40(y1), r2=342(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 40
LDI r2, 342
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
