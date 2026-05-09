; DESCRIPTION: Renders a red disk with center (476, 214) and radius 15.
; PLAN: r0=476(x), r1=214(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 476
LDI r1, 214
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
