; DESCRIPTION: Renders a white box of size 120x23 starting at (67, 88).
; PLAN: r0=67(x), r1=88(y), r2=120(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 88
LDI r2, 120
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
