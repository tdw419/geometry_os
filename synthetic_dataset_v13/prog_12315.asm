; DESCRIPTION: Places a cyan line segment connecting (331, 163) to (311, 28).
; PLAN: r0=331(x1), r1=163(y1), r2=311(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 163
LDI r2, 311
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
