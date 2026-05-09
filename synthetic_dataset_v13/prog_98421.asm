; DESCRIPTION: Renders a black box of size 51x112 starting at (429, 32).
; PLAN: r0=429(x), r1=32(y), r2=51(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 32
LDI r2, 51
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
