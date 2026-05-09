; DESCRIPTION: Places a green line segment connecting (163, 163) to (405, 178).
; PLAN: r0=163(x1), r1=163(y1), r2=405(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 163
LDI r2, 405
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
