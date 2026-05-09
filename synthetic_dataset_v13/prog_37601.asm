; DESCRIPTION: Renders a white box of size 49x76 starting at (383, 98).
; PLAN: r0=383(x), r1=98(y), r2=49(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 98
LDI r2, 49
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
