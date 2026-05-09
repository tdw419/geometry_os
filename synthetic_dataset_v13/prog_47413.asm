; DESCRIPTION: Places a green line segment connecting (290, 163) to (166, 238).
; PLAN: r0=290(x1), r1=163(y1), r2=166(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 163
LDI r2, 166
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
