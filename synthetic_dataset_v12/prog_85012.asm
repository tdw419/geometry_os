; DESCRIPTION: Places a black circle of radius 30 at center (65, 208).
; PLAN: r0=65(x), r1=208(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 208
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
