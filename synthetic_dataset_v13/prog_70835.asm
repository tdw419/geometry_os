; DESCRIPTION: Renders a black box of size 62x58 starting at (192, 44).
; PLAN: r0=192(x), r1=44(y), r2=62(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 44
LDI r2, 62
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
