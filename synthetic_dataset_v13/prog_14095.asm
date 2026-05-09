; DESCRIPTION: Places a green line segment connecting (358, 103) to (156, 244).
; PLAN: r0=358(x1), r1=103(y1), r2=156(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 103
LDI r2, 156
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
