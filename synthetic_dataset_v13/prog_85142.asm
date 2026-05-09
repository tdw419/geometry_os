; DESCRIPTION: Places a yellow circle of radius 76 at center (213, 103).
; PLAN: r0=213(x), r1=103(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 103
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
