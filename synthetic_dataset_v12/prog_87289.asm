; DESCRIPTION: Places a green line segment connecting (166, 86) to (172, 248).
; PLAN: r0=166(x1), r1=86(y1), r2=172(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 86
LDI r2, 172
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
