; DESCRIPTION: Places a yellow circle of radius 37 at center (268, 76).
; PLAN: r0=268(x), r1=76(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 76
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
