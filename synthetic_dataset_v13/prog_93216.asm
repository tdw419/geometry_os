; DESCRIPTION: Renders a white box of size 29x52 starting at (333, 88).
; PLAN: r0=333(x), r1=88(y), r2=29(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 88
LDI r2, 29
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
