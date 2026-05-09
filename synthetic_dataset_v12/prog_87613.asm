; DESCRIPTION: Places a green line segment connecting (272, 7) to (425, 158).
; PLAN: r0=272(x1), r1=7(y1), r2=425(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 7
LDI r2, 425
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
