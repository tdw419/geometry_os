; DESCRIPTION: Places a green circle of radius 72 at center (209, 149).
; PLAN: r0=209(x), r1=149(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 149
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
