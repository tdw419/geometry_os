; DESCRIPTION: Creates a green circular shape at (356, 195) with radius 51.
; PLAN: r0=356(x), r1=195(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 195
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
