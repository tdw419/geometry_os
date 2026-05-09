; DESCRIPTION: Places a yellow circle of radius 37 at center (259, 166).
; PLAN: r0=259(x), r1=166(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 166
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
