; DESCRIPTION: Places a green line segment connecting (285, 163) to (375, 86).
; PLAN: r0=285(x1), r1=163(y1), r2=375(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 163
LDI r2, 375
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
