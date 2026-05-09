; DESCRIPTION: Places a green line segment connecting (197, 161) to (156, 248).
; PLAN: r0=197(x1), r1=161(y1), r2=156(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 161
LDI r2, 156
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
