; DESCRIPTION: Places a green line segment connecting (438, 173) to (124, 156).
; PLAN: r0=438(x1), r1=173(y1), r2=124(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 173
LDI r2, 124
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
