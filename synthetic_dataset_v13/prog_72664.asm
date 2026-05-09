; DESCRIPTION: Places a green line segment connecting (272, 90) to (32, 18).
; PLAN: r0=272(x1), r1=90(y1), r2=32(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 90
LDI r2, 32
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
