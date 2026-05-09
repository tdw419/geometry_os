; DESCRIPTION: Places a yellow circle of radius 43 at center (340, 81).
; PLAN: r0=340(x), r1=81(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 81
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
