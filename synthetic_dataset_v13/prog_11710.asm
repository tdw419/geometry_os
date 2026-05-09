; DESCRIPTION: Renders a white box of size 54x19 starting at (310, 101).
; PLAN: r0=310(x), r1=101(y), r2=54(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 101
LDI r2, 54
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
