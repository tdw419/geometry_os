; DESCRIPTION: Renders a black box of size 71x35 starting at (73, 128).
; PLAN: r0=73(x), r1=128(y), r2=71(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 128
LDI r2, 71
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
