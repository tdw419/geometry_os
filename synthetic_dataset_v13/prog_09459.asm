; DESCRIPTION: Places a cyan line segment connecting (163, 244) to (267, 12).
; PLAN: r0=163(x1), r1=244(y1), r2=267(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 244
LDI r2, 267
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
