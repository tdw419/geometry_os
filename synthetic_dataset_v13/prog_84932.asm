; DESCRIPTION: Renders a black box of size 32x34 starting at (86, 57).
; PLAN: r0=86(x), r1=57(y), r2=32(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 57
LDI r2, 32
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
