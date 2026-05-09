; DESCRIPTION: Places a green line segment connecting (267, 176) to (491, 242).
; PLAN: r0=267(x1), r1=176(y1), r2=491(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 176
LDI r2, 491
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
