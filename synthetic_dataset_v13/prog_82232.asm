; DESCRIPTION: Renders a black box of size 96x42 starting at (234, 122).
; PLAN: r0=234(x), r1=122(y), r2=96(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 122
LDI r2, 96
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
