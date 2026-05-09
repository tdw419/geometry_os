; DESCRIPTION: Places a green line segment connecting (373, 238) to (103, 11).
; PLAN: r0=373(x1), r1=238(y1), r2=103(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 238
LDI r2, 103
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
