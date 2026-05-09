; DESCRIPTION: Places a cyan line segment connecting (483, 4) to (474, 98).
; PLAN: r0=483(x1), r1=4(y1), r2=474(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 4
LDI r2, 474
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
