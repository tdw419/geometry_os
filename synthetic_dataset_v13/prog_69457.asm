; DESCRIPTION: Renders a white box of size 109x69 starting at (13, 73).
; PLAN: r0=13(x), r1=73(y), r2=109(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 73
LDI r2, 109
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
