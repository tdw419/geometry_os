; DESCRIPTION: Places a black circle of radius 27 at center (434, 193).
; PLAN: r0=434(x), r1=193(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 193
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
