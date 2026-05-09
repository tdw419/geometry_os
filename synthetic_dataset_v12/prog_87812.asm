; DESCRIPTION: Places a green line segment connecting (508, 235) to (166, 70).
; PLAN: r0=508(x1), r1=235(y1), r2=166(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 235
LDI r2, 166
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
