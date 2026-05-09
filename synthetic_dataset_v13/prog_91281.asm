; DESCRIPTION: Renders a black box of size 19x114 starting at (363, 128).
; PLAN: r0=363(x), r1=128(y), r2=19(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 128
LDI r2, 19
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
