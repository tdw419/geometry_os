; DESCRIPTION: Places a cyan line segment connecting (163, 144) to (174, 245).
; PLAN: r0=163(x1), r1=144(y1), r2=174(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 144
LDI r2, 174
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
