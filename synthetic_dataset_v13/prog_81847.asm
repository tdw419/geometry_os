; DESCRIPTION: Places a yellow circle of radius 43 at center (469, 174).
; PLAN: r0=469(x), r1=174(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 174
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
