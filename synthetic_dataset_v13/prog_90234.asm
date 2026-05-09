; DESCRIPTION: Places a yellow circle of radius 71 at center (103, 172).
; PLAN: r0=103(x), r1=172(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 172
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
