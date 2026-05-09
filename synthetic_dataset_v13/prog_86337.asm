; DESCRIPTION: Renders a white box of size 40x19 starting at (360, 88).
; PLAN: r0=360(x), r1=88(y), r2=40(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 88
LDI r2, 40
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
