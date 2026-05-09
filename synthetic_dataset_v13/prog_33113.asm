; DESCRIPTION: Places a cyan line segment connecting (354, 6) to (357, 238).
; PLAN: r0=354(x1), r1=6(y1), r2=357(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 6
LDI r2, 357
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
