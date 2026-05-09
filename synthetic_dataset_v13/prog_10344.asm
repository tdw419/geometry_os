; DESCRIPTION: Renders a black box of size 81x30 starting at (128, 179).
; PLAN: r0=128(x), r1=179(y), r2=81(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 179
LDI r2, 81
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
