; DESCRIPTION: Renders a black box of size 51x20 starting at (143, 179).
; PLAN: r0=143(x), r1=179(y), r2=51(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 179
LDI r2, 51
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
