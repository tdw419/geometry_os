; DESCRIPTION: Renders a black box of size 62x82 starting at (54, 14).
; PLAN: r0=54(x), r1=14(y), r2=62(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 14
LDI r2, 62
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
