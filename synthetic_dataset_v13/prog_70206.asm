; DESCRIPTION: Renders a black box of size 71x69 starting at (192, 184).
; PLAN: r0=192(x), r1=184(y), r2=71(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 184
LDI r2, 71
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
