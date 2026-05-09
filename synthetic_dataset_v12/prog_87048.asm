; DESCRIPTION: Renders a black box of size 73x108 starting at (128, 56).
; PLAN: r0=128(x), r1=56(y), r2=73(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 56
LDI r2, 73
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
