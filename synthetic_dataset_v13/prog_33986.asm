; DESCRIPTION: Draws a red circle centered at (356, 126) with radius 51.
; PLAN: r0=356(x), r1=126(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 126
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
