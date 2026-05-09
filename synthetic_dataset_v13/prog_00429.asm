; DESCRIPTION: Creates a green circular shape at (455, 126) with radius 51.
; PLAN: r0=455(x), r1=126(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 126
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
