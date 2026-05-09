; DESCRIPTION: Renders a black box of size 49x82 starting at (300, 98).
; PLAN: r0=300(x), r1=98(y), r2=49(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 98
LDI r2, 49
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
