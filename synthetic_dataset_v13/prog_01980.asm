; DESCRIPTION: Places a green line segment connecting (354, 76) to (343, 16).
; PLAN: r0=354(x1), r1=76(y1), r2=343(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 76
LDI r2, 343
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
