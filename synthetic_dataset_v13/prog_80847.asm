; DESCRIPTION: Places a black circle of radius 76 at center (188, 174).
; PLAN: r0=188(x), r1=174(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 174
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
