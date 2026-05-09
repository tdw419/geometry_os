; DESCRIPTION: Renders a black box of size 43x32 starting at (232, 190).
; PLAN: r0=232(x), r1=190(y), r2=43(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 190
LDI r2, 43
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
