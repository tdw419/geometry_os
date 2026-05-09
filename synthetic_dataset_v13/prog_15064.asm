; DESCRIPTION: Places a yellow circle of radius 46 at center (246, 56).
; PLAN: r0=246(x), r1=56(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 56
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
