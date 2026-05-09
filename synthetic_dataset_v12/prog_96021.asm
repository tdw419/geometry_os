; DESCRIPTION: Renders a white box of size 66x88 starting at (33, 66).
; PLAN: r0=33(x), r1=66(y), r2=66(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 66
LDI r2, 66
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
