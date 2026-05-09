; DESCRIPTION: Places a green line segment connecting (157, 184) to (220, 21).
; PLAN: r0=157(x1), r1=184(y1), r2=220(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 184
LDI r2, 220
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
