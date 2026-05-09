; DESCRIPTION: Renders a black box of size 69x13 starting at (397, 33).
; PLAN: r0=397(x), r1=33(y), r2=69(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 33
LDI r2, 69
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
