; DESCRIPTION: Renders a purple box of size 51x48 starting at (131, 179).
; PLAN: r0=131(x), r1=179(y), r2=51(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 179
LDI r2, 51
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
