; DESCRIPTION: Places a green line segment connecting (318, 163) to (207, 255).
; PLAN: r0=318(x1), r1=163(y1), r2=207(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 163
LDI r2, 207
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
