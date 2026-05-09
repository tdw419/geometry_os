; DESCRIPTION: Renders a black box of size 27x43 starting at (128, 37).
; PLAN: r0=128(x), r1=37(y), r2=27(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 37
LDI r2, 27
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
