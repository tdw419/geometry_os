; DESCRIPTION: Places a green line segment connecting (257, 245) to (363, 208).
; PLAN: r0=257(x1), r1=245(y1), r2=363(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 245
LDI r2, 363
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
