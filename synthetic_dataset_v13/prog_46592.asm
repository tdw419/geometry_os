; DESCRIPTION: Renders a white box of size 77x88 starting at (164, 139).
; PLAN: r0=164(x), r1=139(y), r2=77(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 139
LDI r2, 77
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
