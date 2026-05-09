; DESCRIPTION: Places a black circle of radius 27 at center (264, 132).
; PLAN: r0=264(x), r1=132(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 132
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
