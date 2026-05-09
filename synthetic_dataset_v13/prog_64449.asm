; DESCRIPTION: Places a green line segment connecting (195, 23) to (273, 184).
; PLAN: r0=195(x1), r1=23(y1), r2=273(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 23
LDI r2, 273
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
