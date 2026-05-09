; DESCRIPTION: Places a purple circle of radius 51 at center (164, 154).
; PLAN: r0=164(x), r1=154(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 154
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
