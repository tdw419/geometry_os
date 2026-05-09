; DESCRIPTION: Renders a white box of size 62x76 starting at (337, 101).
; PLAN: r0=337(x), r1=101(y), r2=62(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 101
LDI r2, 62
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
