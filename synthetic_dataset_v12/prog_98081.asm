; DESCRIPTION: Places a black circle of radius 21 at center (317, 222).
; PLAN: r0=317(x), r1=222(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 222
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
