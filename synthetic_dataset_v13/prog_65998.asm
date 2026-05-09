; DESCRIPTION: Places a blue line segment connecting (272, 27) to (417, 12).
; PLAN: r0=272(x1), r1=27(y1), r2=417(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 27
LDI r2, 417
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
