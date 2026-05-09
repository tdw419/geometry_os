; DESCRIPTION: Places a green line segment connecting (195, 16) to (274, 99).
; PLAN: r0=195(x1), r1=16(y1), r2=274(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 16
LDI r2, 274
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
