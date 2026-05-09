; DESCRIPTION: Places a red line segment connecting (272, 174) to (483, 30).
; PLAN: r0=272(x1), r1=174(y1), r2=483(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 174
LDI r2, 483
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
