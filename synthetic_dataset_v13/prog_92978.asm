; DESCRIPTION: Renders a green box of size 26x34 starting at (397, 35).
; PLAN: r0=397(x), r1=35(y), r2=26(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 35
LDI r2, 26
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
