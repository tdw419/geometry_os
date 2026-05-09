; DESCRIPTION: Renders a black box of size 115x32 starting at (28, 223).
; PLAN: r0=28(x), r1=223(y), r2=115(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 223
LDI r2, 115
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
