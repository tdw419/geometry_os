; DESCRIPTION: Renders a black box of size 28x96 starting at (8, 19).
; PLAN: r0=8(x), r1=19(y), r2=28(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 19
LDI r2, 28
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
