; DESCRIPTION: Places a yellow circle of radius 27 at center (270, 172).
; PLAN: r0=270(x), r1=172(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 172
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
