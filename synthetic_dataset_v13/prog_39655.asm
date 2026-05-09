; DESCRIPTION: Places a yellow circle of radius 43 at center (245, 166).
; PLAN: r0=245(x), r1=166(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 166
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
