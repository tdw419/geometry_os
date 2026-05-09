; DESCRIPTION: Renders a black box of size 64x62 starting at (167, 96).
; PLAN: r0=167(x), r1=96(y), r2=64(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 96
LDI r2, 64
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
