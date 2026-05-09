; DESCRIPTION: Places a yellow circle of radius 60 at center (217, 172).
; PLAN: r0=217(x), r1=172(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 172
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
