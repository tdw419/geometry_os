; DESCRIPTION: Places a green line segment connecting (341, 164) to (494, 19).
; PLAN: r0=341(x1), r1=164(y1), r2=494(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 164
LDI r2, 494
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
