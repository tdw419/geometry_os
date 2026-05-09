; DESCRIPTION: Renders a black box of size 85x43 starting at (247, 179).
; PLAN: r0=247(x), r1=179(y), r2=85(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 179
LDI r2, 85
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
