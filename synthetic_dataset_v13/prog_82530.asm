; DESCRIPTION: Places a green line segment connecting (144, 226) to (244, 254).
; PLAN: r0=144(x1), r1=226(y1), r2=244(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 226
LDI r2, 244
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
