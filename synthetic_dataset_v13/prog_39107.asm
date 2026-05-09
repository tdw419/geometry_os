; DESCRIPTION: Renders a black box of size 38x96 starting at (32, 98).
; PLAN: r0=32(x), r1=98(y), r2=38(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 98
LDI r2, 38
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
