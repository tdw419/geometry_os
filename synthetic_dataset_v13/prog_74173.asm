; DESCRIPTION: Places a green line segment connecting (494, 61) to (391, 102).
; PLAN: r0=494(x1), r1=61(y1), r2=391(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 61
LDI r2, 391
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
