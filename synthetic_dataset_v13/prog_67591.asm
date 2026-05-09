; DESCRIPTION: Places a white line segment connecting (421, 76) to (327, 204).
; PLAN: r0=421(x1), r1=76(y1), r2=327(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 76
LDI r2, 327
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
