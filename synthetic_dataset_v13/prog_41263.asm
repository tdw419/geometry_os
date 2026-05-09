; DESCRIPTION: Places a green line segment connecting (425, 7) to (497, 32).
; PLAN: r0=425(x1), r1=7(y1), r2=497(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 7
LDI r2, 497
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
