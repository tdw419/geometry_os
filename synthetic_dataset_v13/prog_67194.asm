; DESCRIPTION: Places a green line segment connecting (272, 39) to (334, 231).
; PLAN: r0=272(x1), r1=39(y1), r2=334(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 39
LDI r2, 334
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
