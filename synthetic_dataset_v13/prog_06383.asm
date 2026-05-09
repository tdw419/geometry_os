; DESCRIPTION: Renders a white box of size 53x69 starting at (68, 65).
; PLAN: r0=68(x), r1=65(y), r2=53(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 65
LDI r2, 53
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
