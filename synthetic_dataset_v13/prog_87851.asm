; DESCRIPTION: Places a green line segment connecting (229, 84) to (329, 246).
; PLAN: r0=229(x1), r1=84(y1), r2=329(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 84
LDI r2, 329
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
