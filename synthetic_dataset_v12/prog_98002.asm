; DESCRIPTION: Places a green line segment connecting (251, 245) to (279, 64).
; PLAN: r0=251(x1), r1=245(y1), r2=279(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 245
LDI r2, 279
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
