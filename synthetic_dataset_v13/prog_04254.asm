; DESCRIPTION: Renders a white box of size 69x54 starting at (24, 26).
; PLAN: r0=24(x), r1=26(y), r2=69(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 26
LDI r2, 69
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
