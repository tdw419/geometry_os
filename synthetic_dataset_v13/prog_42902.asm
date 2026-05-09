; DESCRIPTION: Places a green line segment connecting (341, 220) to (425, 63).
; PLAN: r0=341(x1), r1=220(y1), r2=425(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 220
LDI r2, 425
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
